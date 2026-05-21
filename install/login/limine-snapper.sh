# limine-snapper.sh configures snapper + limine-snapper-sync on systems where
# Limine is the bootloader and root is btrfs. It runs on:
#  - x86 with Limine (the original case)
#  - Asahi/ARM with Limine chainloaded via m1n1/U-Boot (newer setup)
#
# It is *skipped* on:
#  - non-btrfs systems (snapper requires btrfs)
#  - ARM/Asahi without Limine installed (handled by limine-arm64.sh or
#    bin/update-asahi-bootloader instead)
#  - OMARCHY_SKIP_LIMINE (VMware uses GRUB; handled further down)

if [[ $(findmnt -n -o FSTYPE /) != "btrfs" ]]; then
  echo "Skipping Limine snapshot setup: root is not btrfs"
  return 0
fi

if { [ -n "$OMARCHY_ARM" ] || [ -n "$ASAHI_ALARM" ]; } && ! command -v limine &>/dev/null; then
  echo "Skipping Limine snapshot setup: ARM/Asahi without Limine"
  echo "  (Limine on Asahi must be installed manually via m1n1/U-Boot chainload;"
  echo "   omarchy can't bootstrap that yet — see bin/update-asahi-bootloader for"
  echo "   the non-Limine path.)"
  return 0
fi

# Detect Asahi — used below to preserve /etc/mkinitcpio.conf HOOKS instead of
# overwriting them with an x86-centric set that would drop the `asahi` hook.
IS_ASAHI=false
if grep -q "apple" /sys/firmware/devicetree/base/compatible 2>/dev/null; then
  IS_ASAHI=true
fi

# Re-enable mkinitcpio hooks (required for all bootloaders)
echo "Re-enabling mkinitcpio hooks..."

# Restore the specific mkinitcpio pacman hooks
if [ -f /usr/share/libalpm/hooks/90-mkinitcpio-install.hook.disabled ]; then
  sudo mv /usr/share/libalpm/hooks/90-mkinitcpio-install.hook.disabled /usr/share/libalpm/hooks/90-mkinitcpio-install.hook
fi

if [ -f /usr/share/libalpm/hooks/60-mkinitcpio-remove.hook.disabled ]; then
  sudo mv /usr/share/libalpm/hooks/60-mkinitcpio-remove.hook.disabled /usr/share/libalpm/hooks/60-mkinitcpio-remove.hook
fi

echo "mkinitcpio hooks re-enabled"

# Configure mkinitcpio hooks.
# - On Asahi: preserve /etc/mkinitcpio.conf (asahi-alarm's base install already
#   set up the right HOOKS with `asahi`, `btrfs`, `microcode`, etc. in the right
#   order). Just sanity-check the essentials.
# - On x86: write the standard omarchy HOOKS to a drop-in.
if [[ $IS_ASAHI == "true" ]]; then
  echo "Asahi detected — preserving existing /etc/mkinitcpio.conf HOOKS"
  HOOKS_LINE=$(grep -E '^HOOKS=' /etc/mkinitcpio.conf | head -1)
  if ! grep -qE '\basahi\b' <<<"$HOOKS_LINE"; then
    echo "WARNING: 'asahi' hook missing from /etc/mkinitcpio.conf — Asahi may not boot"
  fi
  if ! grep -qE '\bbtrfs\b' <<<"$HOOKS_LINE"; then
    echo "WARNING: 'btrfs' hook missing from /etc/mkinitcpio.conf — boot-from-snapshot won't work; add it to HOOKS"
  fi
else
  echo "Configuring mkinitcpio hooks..."
  sudo tee /etc/mkinitcpio.conf.d/omarchy_hooks.conf <<EOF >/dev/null
HOOKS=(base udev plymouth keyboard autodetect microcode modconf kms keymap consolefont block encrypt filesystems fsck btrfs-overlayfs)
EOF
fi

# Skip if Limine is not supported (e.g., VMware uses GRUB)
if [ -n "$OMARCHY_SKIP_LIMINE" ]; then
  echo "Skipping Limine installation (bootloader not supported on this platform)"
  echo "Regenerating initramfs for GRUB..."

  # Run mkinitcpio but don't fail on warnings
  sudo mkinitcpio -P || {
    exit_code=$?
    echo "mkinitcpio exited with code $exit_code - checking if initramfs was created..."
    if [ -f /boot/initramfs-linux.img ]; then
      echo "Initramfs created successfully despite warnings, continuing..."
    else
      echo "Failed to create initramfs, exiting..."
      exit $exit_code
    fi
  }

  return 0
fi

if command -v limine &>/dev/null; then
  # HOOKS were already configured above (Asahi: preserved; x86: written to drop-in).
  # Thunderbolt module is x86-only (no thunderbolt on Asahi/ARM).
  if [[ $IS_ASAHI != "true" ]]; then
    sudo tee /etc/mkinitcpio.conf.d/thunderbolt_module.conf <<EOF >/dev/null
MODULES+=(thunderbolt)
EOF
  fi

  # Detect boot mode
  [[ -d /sys/firmware/efi ]] && EFI=true

  # Find config location
  if [[ -f /boot/EFI/arch-limine/limine.conf ]]; then
    limine_config="/boot/EFI/arch-limine/limine.conf"
  elif [[ -f /boot/EFI/BOOT/limine.conf ]]; then
    limine_config="/boot/EFI/BOOT/limine.conf"
  elif [[ -f /boot/EFI/limine/limine.conf ]]; then
    limine_config="/boot/EFI/limine/limine.conf"
  elif [[ -f /boot/limine/limine.conf ]]; then
    limine_config="/boot/limine/limine.conf"
  elif [[ -f /boot/limine.conf ]]; then
    limine_config="/boot/limine.conf"
  else
    echo "Error: Limine config not found" >&2
    exit 1
  fi

  CMDLINE=$(grep "^[[:space:]]*cmdline:" "$limine_config" | head -1 | sed 's/^[[:space:]]*cmdline:[[:space:]]*//')

  # Write /etc/default/limine *before* installing limine-mkinitcpio-hook, whose
  # post-transaction deploy hook runs limine-install and reads this file. Without
  # it, ESP_PATH falls back to bootctl, which in a chroot prints a warning that
  # gets captured as the path and trips a spurious "invalid ESP" error.
  sudo cp $OMARCHY_PATH/default/limine/default.conf /etc/default/limine
  sudo sed -i "s|@@CMDLINE@@|$CMDLINE|g" /etc/default/limine

  # Append any drop-in kernel cmdline configs (from hardware fix scripts, etc.)
  for dropin in /etc/limine-entry-tool.d/*.conf; do
    [ -f "$dropin" ] && cat "$dropin" | sudo tee -a /etc/default/limine >/dev/null
  done

  # UKI and EFI fallback are EFI only
  if [[ -z $EFI ]]; then
    sudo sed -i '/^ENABLE_UKI=/d; /^ENABLE_LIMINE_FALLBACK=/d' /etc/default/limine
  fi

  # Remove the original config file if it's not /boot/limine.conf, so the deploy
  # hook doesn't see conflicting configs on the same ESP.
  if [[ $limine_config != "/boot/limine.conf" ]] && [[ -f $limine_config ]]; then
    sudo rm "$limine_config"
  fi

  # We overwrite the whole thing knowing the limine-update will add the entries for us
  sudo cp $OMARCHY_PATH/default/limine/limine.conf /boot/limine.conf

  sudo pacman -S --noconfirm --needed limine-snapper-sync limine-mkinitcpio-hook

  # Only snapshot root — /home is user data; rolling it back loses user work
  if ! sudo snapper list-configs 2>/dev/null | grep -q "root"; then
    sudo snapper -c root create-config /
  fi
  sudo cp $OMARCHY_PATH/default/snapper/root /etc/snapper/configs/root

  # Disable btrfs quotas — full qgroup accounting is a major performance drag
  sudo btrfs quota disable / 2>/dev/null || true

  chrootable_systemctl_enable limine-snapper-sync.service
fi

# mkinitcpio hooks were already re-enabled at the top of this script (before the
# ARM/SKIP_LIMINE early returns), so they run for every non-ARM path.
#
# Installing limine-mkinitcpio-hook above already triggered a full UKI rebuild
# (via 80-limine-efi-deploy.hook + 90-mkinitcpio-install.hook), which writes the
# boot entries into /boot/limine.conf. Only fall back to limine-update if those
# hooks didn't run for some reason — running it unconditionally rebuilds every
# UKI a second time.
if ! grep -q "^/+" /boot/limine.conf; then
  sudo limine-update
fi

if ! grep -q "^/+" /boot/limine.conf; then
  echo "Error: failed to add boot entries to /boot/limine.conf" >&2
  exit 1
fi

if [[ -n $EFI ]] && efibootmgr &>/dev/null; then
  # Remove the archinstall-created Limine entry
  while IFS= read -r bootnum; do
    sudo efibootmgr -b "$bootnum" -B >/dev/null 2>&1
  done < <(efibootmgr | grep -E "^Boot[0-9]{4}\*? Arch Linux Limine" | sed 's/^Boot\([0-9]\{4\}\).*/\1/')
fi
