# Skip for ARM systems entirely
if [ -n "$OMARCHY_ARM" ] || [ -n "$ASAHI_ALARM" ]; then
  echo "Skipping x86_64 Limine configuration on ARM system"
  return 0
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

# Configure mkinitcpio hooks for all x86_64 systems
echo "Configuring mkinitcpio hooks..."
sudo tee /etc/mkinitcpio.conf.d/omarchy_hooks.conf <<EOF >/dev/null
HOOKS=(base udev plymouth keyboard autodetect microcode modconf kms keymap consolefont block encrypt filesystems fsck btrfs-overlayfs)
EOF

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
  sudo tee /etc/mkinitcpio.conf.d/omarchy_hooks.conf <<EOF >/dev/null
HOOKS=(base udev plymouth keyboard autodetect microcode modconf kms keymap consolefont block encrypt filesystems fsck btrfs-overlayfs)
EOF
  sudo tee /etc/mkinitcpio.conf.d/thunderbolt_module.conf <<EOF >/dev/null
MODULES+=(thunderbolt)
EOF

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
