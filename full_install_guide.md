# Install Omarchy on an m4 macbook pro with Parallels

Download archboot from here https://release.archboot.com/aarch64/latest/iso/
![[CleanShot 2025-08-30 at 18.25.18@2x.png]]
I chose the largest one, which is an offline "local" installer.

> **Network Requirements**: Local ISOs work offline (largest), standard ISOs need internet (medium), netboot (smallest) requires _wired_ ethernet.

## Create a new VM choosing "Install from an image file"

![[CleanShot 2025-08-30 at 18.33.29@2x.png]]

## Choose your iso manually

![[CleanShot 2025-08-30 at 18.35.16@2x.png]]

![[CleanShot 2025-08-30 at 18.37.59@2x.png]]

![[CleanShot 2025-08-30 at 18.38.27@2x.png]]

![[CleanShot 2025-08-30 at 18.36.03@2x.png]]

![[CleanShot 2025-08-30 at 18.39.05@2x 1.png]]

![[CleanShot X 2025-08-30 18.40.59.png]]

The Configuration window will appear
![[CleanShot 2025-08-30 at 18.41.21@2x.png]]

Customize the Hardware preferences
![[CleanShot 2025-08-30 at 18.45.21@2x.png]]

![[CleanShot 2025-08-30 at 19.34.08@2x.png]]

![[CleanShot 2025-08-30 at 19.40.11@2x.png]]

## Ensure CD/DVD is chosen for boot order, initially

![[CleanShot 2025-08-30 at 19.31.36@2x.png]]

![[CleanShot 2025-08-30 at 19.32.18@2x.png]]

Up to you, but I'm leaving SmartGuard off. I plan to manually take snapshots.
![[CleanShot 2025-08-30 at 19.33.15@2x.png]]

## Since you've selected the ISO, start the machine and it'll boot to this screen

![[CleanShot 2025-08-30 at 21.12.40@2x.png]]

## Then it'll boot to the Aarch64 ISO

![[CleanShot 2025-08-30 at 21.11.53@2x.png]]

## Choose "ENTER" and set it up with your locale.

![[CleanShot 2025-08-30 at 21.34.15@2x.png]]

## Then choose "No" when prompted to use Online Mode since the mirrors are experiencing DDoS attacks as of August 2025.

![[CleanShot 2025-08-30 at 21.13.52@2x.png]]

![[CleanShot 2025-08-30 at 21.14.31@2x.png]]

![[CleanShot 2025-08-30 at 21.14.54@2x.png]]

![[CleanShot 2025-08-30 at 21.39.25@2x.png]]

![[CleanShot 2025-08-30 at 21.39.33@2x.png]]

![[CleanShot 2025-08-30 at 21.15.41@2x.png]]

![[CleanShot 2025-08-30 at 21.47.48@2x.png]]

![[CleanShot 2025-08-30 at 21.52.49@2x.png]]

![[CleanShot 2025-08-30 at 21.52.55@2x.png]]

![[CleanShot 2025-08-30 at 21.53.01@2x.png]]

![[CleanShot 2025-08-30 at 21.53.10@2x.png]]

![[CleanShot 2025-08-30 at 21.59.11@2x.png]]

![[CleanShot 2025-08-30 at 21.59.21@2x.png]]

![[CleanShot 2025-08-30 at 21.59.30@2x.png]]

![[CleanShot 2025-08-30 at 21.59.38@2x.png]]

![[CleanShot 2025-08-30 at 22.00.06@2x.png]]

![[CleanShot 2025-08-30 at 22.00.45@2x.png]]

![[CleanShot 2025-08-30 at 22.00.53@2x.png]]

![[CleanShot 2025-08-30 at 22.00.59@2x.png]]

![[CleanShot 2025-08-30 at 22.13.46@2x.png]]

## Step 2 - Install Packages

![[CleanShot 2025-08-30 at 22.04.14@2x.png]]

![[CleanShot 2025-08-30 at 22.04.30@2x.png]]

![[CleanShot 2025-08-30 at 22.14.14@2x.png]]

![[CleanShot 2025-08-30 at 22.14.31@2x.png]]

Let it complete, then choose "Configure System"
![[CleanShot 2025-08-30 at 22.06.09@2x.png]]

![[CleanShot 2025-08-30 at 22.06.15@2x.png]]

![[CleanShot 2025-08-30 at 22.15.21@2x.png]]

Don't be a baby...
![[CleanShot 2025-08-30 at 22.06.27@2x.png]]

![[CleanShot 2025-08-30 at 22.15.34@2x.png]]

## MKINITCPIO Setup

![[CleanShot 2025-08-30 at 22.06.59@2x.png]]

![[CleanShot 2025-08-30 at 22.15.49@2x.png]]

When that completes you'll see this
![[CleanShot 2025-08-30 at 22.07.29@2x.png]]

Enter User Management
![[CleanShot 2025-08-30 at 22.07.55@2x.png]]

Omarchy uses Bash, just deal with it...
![[CleanShot 2025-08-30 at 22.08.16@2x.png]]

![[CleanShot 2025-08-30 at 22.16.09@2x.png]]

## Create a user account

![[CleanShot 2025-08-30 at 22.08.38@2x.png]]

![[CleanShot 2025-08-30 at 22.08.49@2x.png]]

![[CleanShot 2025-08-30 at 22.08.56@2x.png]]

![[CleanShot 2025-08-30 at 22.09.07@2x.png]]

![[CleanShot 2025-08-30 at 22.09.13@2x.png]]

![[CleanShot 2025-08-30 at 22.09.18@2x.png]]

![[CleanShot 2025-08-30 at 22.09.24@2x.png]]

![[CleanShot 2025-08-30 at 22.17.10@2x.png]]

![[CleanShot 2025-08-30 at 22.09.38@2x.png]]

## Return to main menu

![[CleanShot 2025-08-30 at 22.23.30@2x.png]]

## Install Bootloader

![[CleanShot 2025-08-30 at 22.30.44@2x.png]]

## Install the GRUB_EUFI Bootloader

![[CleanShot 2025-08-30 at 22.31.55@2x.png]]

![[CleanShot 2025-08-30 at 22.32.27@2x.png]]

![[CleanShot 2025-08-30 at 22.32.35@2x.png]]

## Review GRUB_EUFI Configuration file

![[CleanShot 2025-08-30 at 22.32.46@2x.png]]

Just save and quit again `:wq`
![[CleanShot 2025-08-30 at 22.33.18@2x.png]]

![[CleanShot 2025-08-30 at 22.33.33@2x.png]]

![[CleanShot 2025-08-30 at 22.33.36@2x.png]]

![[CleanShot 2025-08-30 at 22.33.57@2x.png]]

## Reboot to your new aarch64 install!

![[CleanShot 2025-08-30 at 22.34.12@2x.png]]

## Remove the ISO from the cd/dvd drive before reboot!

![[CleanShot 2025-08-31 at 00.06.32@2x.png]]

## Disconnect the ISO in 10s before the reboot happens!

![[CleanShot 2025-08-31 at 00.09.18@2x.png]]

Then you'll boot to the GRUB menu
![[CleanShot 2025-08-30 at 22.36.16@2x.png]]

Choose \*Arch Linux and boot! Then login
![[CleanShot 2025-08-30 at 22.37.06@2x.png]]

For me it's "jon" and my password and I'm in

## Congrats! You now have aarch64 installed to a VM!

![[CleanShot 2025-08-30 at 22.37.29@2x.png]]

## Shutdown the machine so we can resize the hard drive before installing Omarchy

![[CleanShot 2025-08-30 at 22.38.06@2x.png]]

Again, not sure why, but it seems like a bug that you have to fully install `aarch64` before you can resize the Parallels Hard Drive. Typically you'd be able to do that when setting it up, which would save us some steps, but it's not that big of a deal. Let's increase the Parallels disk size now that `aarch64` is installed.

## Open Parallels Control Center and right click your VM

![[CleanShot 2025-08-30 at 22.39.49@2x.png]]

## Choose "Configure..."

![[CleanShot 2025-08-30 at 22.40.30@2x.png]]

## Set the Hard Drive size to be 128gb or larger (I chose 256gb) and click "Apply"

![[CleanShot 2025-08-30 at 22.41.36@2x.png]]

## Choose "Continue"

![[CleanShot 2025-08-30 at 22.42.06@2x.png]]

![[CleanShot 2025-08-30 at 22.43.48@2x.png]]

![[Untitled 3.png]]

The warning says we're not on an SSD, but we are. I _think_ this is fine, but more research is needed. It's possible that if the machine doesn't _think_ it's on an SSD, even though it is, this could impact performance. Please let me know in the comments.
![[CleanShot 2025-08-30 at 22.46.15@2x.png]]

![[CleanShot 2025-08-30 at 22.47.14@2x.png]]

Now you have a Parallels VM with Aarch64 and a 256GB Hard drive which is big enough for Omarchy to be installed on.

Go back to the Control Center and double click your new VM to launch it!
![[CleanShot 2025-08-30 at 22.48.29@2x.png]]

Press Play!
![[CleanShot 2025-08-30 at 22.48.49@2x.png]]

At the GRUB bootloader, choose: `*Arch Linux`
![[CleanShot 2025-08-30 at 22.49.03@2x.png]]

Now you're back to the login, so login with the root user and the password you set for the root user so that we can install the `sudo` package to allow elevating our normal user with root permissions.
![[CleanShot 2025-08-30 at 23.00.26@2x.png]]

Install `sudo` and `openssh`

```bash
pacman -Syu sudo openssh
```

![[CleanShot 2025-08-30 at 23.20.38@2x.png]]

![[CleanShot 2025-08-30 at 23.21.19@2x.png]]

Install finished
![[CleanShot 2025-08-30 at 23.22.23@2x.png]]

## Add your user to the `wheel` group (TODO: verify that this is already taken care of from the install and remove if so)

```
usermod -aG wheel jon
```

![[CleanShot 2025-08-30 at 23.23.09@2x.png]]

## Instal `vi` so we can check the sudoers files

```
pacman -Syu vi
```

![[CleanShot 2025-08-30 at 23.23.53@2x.png]]

Now run `visudo` and make sure it looks like this:
![[CleanShot 2025-08-30 at 23.24.52@2x.png]]

Save and quit the visudo file with `:wq`

## Set up SSH

Enable and start the SSH service

```
systemctl enable sshd
systemctl start sshd
```

![[CleanShot 2025-08-30 at 23.28.28@2x.png]]

### Check SSH is running

```
systemctl status sshd
```

![[CleanShot 2025-08-30 at 23.28.54@2x.png]]

## Find your VM's IP address

```
ip addr show
```

![[CleanShot 2025-08-30 at 23.29.31@2x.png]]

Now we can connect from our host machine over SSH in something like Ghostty or iTerm2 or Alacrity, etc. to more easily copy and paste commands!
![[CleanShot 2025-08-30 at 23.31.01@2x.png]]

Ensure that we have full compatibility by adding `export TERM=xterm-256color` to the bottom of the `~/.bashrc` file like so:

```
export TERM=xterm-256color
```

![[CleanShot 2025-08-30 at 23.35.24@2x.png]]

Write and quit with `:wq` then close the connection by typing `exit` and then re-connect and you should have the ability to type `clear` amongst other things. We're fully compatible now!

## Grow the root partition to the new 256gb size

Check the partition names with `lsblk` and `sudo fdisk -l`
![[CleanShot 2025-08-31 at 00.19.12@2x.png]]

## Install the `parted` disk utility

![[CleanShot 2025-08-31 at 00.21.12@2x.png]]

## Grow the partition with `parted`

```
sudo parted /dev/sda resizepart 4 100%
```

![[CleanShot 2025-08-31 at 00.21.43@2x.png]]

We can ignore the details in the "Information:" response
![[CleanShot 2025-08-31 at 00.22.15@2x.png]]

Our root partition is now 256gb. Huzzah!
![[CleanShot 2025-08-31 at 00.22.58@2x.png]]

## Resize the Btrfs filesystem to use the expanded partition

After growing the partition, we need to tell the Btrfs filesystem to use the newly available space:

```bash
sudo btrfs filesystem resize max /
```

This command resizes the Btrfs filesystem on the root mount point (/) to use the maximum available space on the partition.

At this point I'd recommend taking a snapshot of the system so that if any of the following steps fail, we can easily restore to this point in time.

## Take a snapshot

Shutdown the VM

```
shutdown now
```

![[CleanShot 2025-08-31 at 00.24.34@2x.png]]

When you open Parallels back up, before booting, choose "Take Snapshot..." from the "Actions" menu.
![[CleanShot 2025-08-31 at 00.25.25@2x.png]]

Name and describe your snapshot, save it, and reboot the system. From this safe point, we'll configure the default bootloader that Omarchy's ISO uses so we can take advantage of automatic snapshots the same way an ISO installed to real hardware would.

# Reconnect to continue

Reconnect to your VM over SSH (use your username and IP address)

```bash
ssh jon@10.211.55.9
```

# Limine + Btrfs Snapshots on Parallels ARM64

## Prerequisites

- Fresh Arch Linux ARM64 on Parallels Desktop
- Btrfs filesystem with `/root` subvolume

#### Prepare EFI Directory

Ensure the EFI directory structure exists. Run the following:

```bash
ESP="/boot"
EFI_DIR="$ESP/EFI/BOOT"
sudo mkdir -p "$EFI_DIR"
```

## Step 1: Install Development Tools

#### Install base requirements

```bash
sudo pacman -S --needed base-devel git
```

#### Install yay AUR helper (skip if already installed)

```bash
if ! command -v yay &> /dev/null; then
    cd /tmp
    rm -rf yay 2>/dev/null || true
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
else
    echo "yay is already installed, skipping..."
fi
```

## Step 2: Install Snapshot Tools

```bash
sudo pacman -S --needed --noconfirm snapper
```

#### Install `limine-mkinitcpio-hook` for the `btrfs-overlayfs` hook\*

> \*needed for snapshot booting

This handles yay's interactive prompts automatically

```bash
(echo "1"; echo "N"; echo "N"; echo "N") | yay -S --noconfirm limine-mkinitcpio-hook || {
    echo "Note: If limine-mkinitcpio-hook installation had issues, trying manual approach..."
    # Fallback: Install with minimal interaction
    yay -S --answerdiff None --answerclean None --removemake --noconfirm limine-mkinitcpio-hook
}
```

## Step 3: Configure Snapper

#### Create Snapper config (skip if already exists)

```bash
if ! sudo snapper -c root list &>/dev/null; then
    sudo snapper -c root create-config /
    echo "Snapper config created"
else
    echo "Snapper config for root already exists, skipping creation..."
fi
```

#### Configure settings (Omarchy defaults)

```bash
sudo sed -i 's/^TIMELINE_CREATE="yes"/TIMELINE_CREATE="no"/' /etc/snapper/configs/root
sudo sed -i 's/^NUMBER_LIMIT="50"/NUMBER_LIMIT="5"/' /etc/snapper/configs/root
sudo sed -i 's/^NUMBER_LIMIT_IMPORTANT="10"/NUMBER_LIMIT_IMPORTANT="5"/' /etc/snapper/configs/root
```

## Step 4: Create Custom Sync Script for ARM64

We'll create a custom script since the Java-based tools don't work with ARM64 Limine v9 syntax:

```bash
sudo tee /usr/local/bin/limine-snapshot-sync-arm <<EOF
#!/bin/bash

LIMINE_CONF="$EFI_DIR/limine.conf"
UUID=\$(blkid | grep 'TYPE="btrfs"' | grep -oP 'UUID="\K[^"]+' | head -1)

# Remove old snapshot entries (everything after the fallback entry)
sed -i '/^\/Snapshot/,\$d' "\$LIMINE_CONF"

# Add snapshot entries using simple parsing
snapper -c root list | tail -n +3 | while read -r line; do
    # Extract snapshot number (first field)
    num=\$(echo "\$line" | awk '{print \$1}')

    # Extract description (everything after the last │)
    desc=\$(echo "\$line" | sed 's/.*│ \([^│]*\) │\$/\1/' | xargs)

    if [[ \$num != "0" && -n \$num && \$num =~ ^[0-9]+\$ ]]; then
        # Clean description or use default
        [[ -z "\$desc" || "\$desc" == " " || "\$desc" == "-" ]] && desc="System snapshot"

        cat >> "\$LIMINE_CONF" <<ENTRY

/Snapshot \$num - \$desc
    protocol: linux
    path: boot():/Image
    module_path: boot():/initramfs-linux.img
    cmdline: root=UUID=\$UUID rw rootfstype=btrfs rootflags=subvol=root/.snapshots/\$num/snapshot
ENTRY
    fi
done

echo "Synchronized snapshots to Limine boot menu"
EOF

sudo chmod +x /usr/local/bin/limine-snapshot-sync-arm
```

## Step 5: Set Up Automatic Snapshot Sync Service for ARM64

Create a watcher service that monitors for snapshot changes and automatically syncs them to Limine:

```bash
# Create ARM64 watcher script that monitors snapshot directory
sudo tee /usr/local/bin/limine-snapshot-sync-arm-watcher <<'EOF'
#!/bin/bash

WATCH_DIR="/.snapshots"
SYNC_CMD="/usr/local/bin/limine-snapshot-sync-arm"

# Check if script is run with root privileges
if ((EUID != 0)); then
    echo -e "\033[91m limine-snapshot-sync-arm-watcher must be run with root privileges.\033[0m" >&2
    exit 1
fi

# Check if root filesystem is Btrfs
fstype=$(findmnt --mountpoint / -no FSTYPE)
if [[ "$fstype" != "btrfs" ]]; then
    echo -e "\033[91m Root filesystem is not Btrfs. Watcher stopped.\033[0m" >&2
    exit 0
fi

# Check if we're in a read-only snapshot
if [[ $(btrfs property get / ro 2>/dev/null) == *true ]]; then
    echo -e "\033[91m You are in a read-only Btrfs snapshot. Watcher stopped.\033[0m" >&2
    exit 0
fi

# Check if we're booted from a snapshot
cmdline=$(</proc/cmdline)
if [[ $cmdline =~ rootflags.*subvol=.*?/([0-9]+)/snapshot ]]; then
    echo -e "\033[91m You are booted from a snapshot. Watcher stopped.\033[0m" >&2
    exit 0
fi

# Initial sync if snapshots directory exists
if [[ -d "$WATCH_DIR" ]]; then
    echo "Running initial snapshot sync..."
    $SYNC_CMD
fi

# Monitor directory for creation/deletion events
echo "Monitoring $WATCH_DIR for snapshot changes..."
inotifywait -q -m -e create -e delete --format '%e|%f' "${WATCH_DIR}" | while IFS='|' read -r event snapID; do
    echo "[EVENT] $event -> $snapID"
    # Run sync in background to avoid blocking
    $SYNC_CMD &
done
EOF

sudo chmod +x /usr/local/bin/limine-snapshot-sync-arm-watcher

# Install inotify-tools for directory monitoring
sudo pacman -S --needed --noconfirm inotify-tools

# Create systemd service for automatic syncing
sudo tee /etc/systemd/system/limine-snapshot-sync-arm.service <<'EOF'
[Unit]
Description=Limine ARM64 Snapshot Sync Service
After=multi-user.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/bin/limine-snapshot-sync-arm-watcher
Restart=on-failure
RestartSec=10s

# Security hardening
CapabilityBoundingSet=CAP_SYS_ADMIN
LockPersonality=yes
ProtectControlGroups=yes
ProtectClock=yes
ProtectHome=yes
ProtectHostname=yes
ProtectKernelLogs=yes
ProtectKernelModules=yes
ProtectKernelTunables=yes
ReadWritePaths=/tmp /boot/EFI/BOOT
RemoveIPC=yes
RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6
RestrictNamespaces=yes
RestrictSUIDSGID=yes
NoNewPrivileges=yes
SystemCallArchitectures=native
SystemCallFilter=@system-service @mount

[Install]
WantedBy=multi-user.target
EOF

# Create override for any existing limine-snapper-sync service (if installed by Omarchy)
sudo mkdir -p /etc/systemd/system/limine-snapper-sync.service.d
sudo tee /etc/systemd/system/limine-snapper-sync.service.d/arm64-override.conf <<'EOF'
# Override to use ARM64 sync script instead of Java-based tool
[Service]
ExecStart=
ExecStart=/usr/local/bin/limine-snapshot-sync-arm-watcher
EOF

# Enable and start the service
sudo systemctl daemon-reload
sudo systemctl enable --now limine-snapshot-sync-arm.service

# Verify service is running
sudo systemctl status limine-snapshot-sync-arm.service --no-pager
```

## Step 6: Create Test Snapshots

Note: We'll test the sync script after Limine is installed

```bash
sudo snapper -c root create --description "Initial setup"
```

Show the last snapshot in the list

```
sudo snapper -c root list
```

## Step 7: Install Plymouth and Set Up mkinitcpio Hooks

#### Install Plymouth for boot splash screen

```bash
sudo pacman -S --needed --noconfirm plymouth
```

#### Configure hooks with Plymouth and btrfs-overlayfs for snapshot booting

```bash
sudo tee /etc/mkinitcpio.conf.d/omarchy_hooks.conf <<'EOF'
HOOKS=(base udev plymouth keyboard autodetect modconf kms keymap consolefont block encrypt filesystems fsck btrfs-overlayfs)
EOF
```

#### Regenerate initramfs (answering 'n' to the prompt)

```bash

printf "n\n" | sudo mkinitcpio -P
```

## 🎯 PARALLELS SNAPSHOT POINT 🎯

**Create a Parallels snapshot here!** This allows you to easily test different Limine versions or revert if something goes wrong with the following bootloader installation.

## Step 8: Install and Configure Limine

This step combines downloading Limine, creating the configuration, and installing everything:

#### Download Limine 9.5.3 binary directly

```bash
cd /tmp
rm -rf limine 2>/dev/null || true
git clone --depth 1 --branch v9.5.3-binary https://github.com/limine-bootloader/limine.git
cd limine
```

#### Verify the EFI file exists (binary tags store EFI at repo root)

```bash
if [[ ! -f "BOOTAA64.EFI" ]]; then
    echo "ERROR: BOOTAA64.EFI not found in repository!"
    exit 1
fi
ls -la BOOTAA64.EFI
```

#### Create Tokyo Night themed config with working ARM64 syntax

```bash
sudo tee "$EFI_DIR/limine.conf" <<EOF
# $EFI_DIR/limine.conf (Limine v9 syntax)
timeout: 12
interface_branding: Omarchy Bootloader
interface_branding_color: 2
hash_mismatch_panic: no

term_background: 1a1b26
backdrop: 1a1b26
term_palette: 15161e;f7768e;9ece6a;e0af68;7aa2f7;bb9af7;7dcfff;a9b1d6
term_palette_bright: 414868;f7768e;9ece6a;e0af68;7aa2f7;bb9af7;7dcfff;c0caf5
term_foreground: c0caf5
term_foreground_bright: c0caf5
term_background_bright: 24283b

/Arch Linux ARM (Parallels)
    protocol: linux
    path: boot():/Image
    module_path: boot():/initramfs-linux.img
    cmdline: root=UUID=YOUR_ROOT_UUID_HERE rw rootfstype=btrfs
EOF
```

#### Replace placeholder with actual UUID

```bash
ROOT_UUID=$(blkid | grep 'TYPE="btrfs"' | grep -oP 'UUID="\K[^"]+' | head -1)
if [[ -z "$ROOT_UUID" ]]; then
    echo "ERROR: Could not find Btrfs root UUID!"
    exit 1
fi
sudo sed -i "s/YOUR_ROOT_UUID_HERE/$ROOT_UUID/g" "$EFI_DIR/limine.conf"
```

Show your Root UUID

```bash
echo "Using root UUID: $ROOT_UUID"
```

#### Create backup directory if it doesn't exist

```bash
BACKUP_DIR="${EFI_DIR}.bak"
if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "Creating backup: $EFI_DIR → $BACKUP_DIR"
    sudo mkdir -p "$BACKUP_DIR"
    if compgen -G "$EFI_DIR/*" >/dev/null 2>&1; then
        sudo cp -a "$EFI_DIR/." "$BACKUP_DIR/"
    fi
fi
```

#### Install Limine bootloader

```bash
TMPDIR="/tmp/limine"
echo "Installing $TMPDIR/BOOTAA64.EFI → $EFI_DIR/BOOTAA64.EFI"
sudo install -m 0644 "$TMPDIR/BOOTAA64.EFI" "$EFI_DIR/BOOTAA64.EFI"
```

#### Create or find Limine boot entry

```bash
DISK="/dev/sda"
ESP_NUM="2"
LIMINE_LABEL="Limine"
ENTRY=$(sudo efibootmgr -v | awk '/^Boot[0-9A-Fa-f]{4}/ && (/Limine/ || /\\\\EFI\\\\BOOT\\\\BOOTAA64.EFI/){gsub("^Boot","",$1);gsub("\\*","",$1);print $1;exit}')
```

#### Create the new Limine boot entry

```bash
if [[ -z "$ENTRY" ]]; then
    echo "Creating new Limine boot entry..."
    sudo efibootmgr -c -d "$DISK" -p "$ESP_NUM" -L "$LIMINE_LABEL" -l '\EFI\BOOT\BOOTAA64.EFI'

    # Find the newly created entry
    ENTRY=$(sudo efibootmgr -v | awk '/^Boot[0-9A-Fa-f]{4}/ && (/Limine/ || /\\\\EFI\\\\BOOT\\\\BOOTAA64.EFI/){gsub("^Boot","",$1);gsub("\\*","",$1);print $1;exit}')
else
    echo "Found existing Limine boot entry: Boot$ENTRY"
fi
```

#### Set boot order (keeping GRUB as default for safety)

```bash
LIMINE_NUM=$(sudo efibootmgr | grep "Limine" | cut -c5-8)
sudo efibootmgr --bootorder 0005,${LIMINE_NUM},0002,0003,0000,0004
```

#### Verify installation

```bash
ls -la "$EFI_DIR/BOOTAA64.EFI" "$EFI_DIR/limine.conf"
```

Preview the final `limine.conf`

```bash
cat "$EFI_DIR/limine.conf"
```

## Test Limine (One-Time Boot\*)

> \*Set Limine for the next boot only

```bash
LIMINE_NUM=$(sudo efibootmgr | grep "Limine" | cut -c5-8)
sudo efibootmgr --bootnext $LIMINE_NUM
```

Reboot

```bash
sudo reboot
```

Your SSH session will disconnect. Open Parallels and you should see:

- Limine bootloader with Tokyo Night theme
- "Omarchy Bootloader" branding
- Arch Linux ARM entries
- Snapshot entries: "Initial Setup"

If Limine doesn't boot properly you can "reset" the VM and the system will automatically boot back to GRUB.

![[CleanShot 2025-09-01 at 14.45.13@2x.png]]

## Make `Limine` Permanent (After Testing)

Once you've verified Limine works correctly set it as the default bootloader:

```bash
LIMINE_NUM=$(sudo efibootmgr | grep "Limine" | cut -c5-8)
sudo efibootmgr --bootorder ${LIMINE_NUM},0005,0002,0003,0000,0004
```

Verify `Limine (0001)` is now first in the BootOrder

```bash
BootCurrent: 0001
Timeout: 0 seconds
BootOrder: 0001,0005,0002,0003,0000,0004
Boot0000* UiApp FvVol(45801e53-5502-4463...
Boot0001* Limine        HD(2,GPT,d810e6b...
Boot0002* UEFI Aarch64-0 SSD ESNER7SSCGS...
Boot0003* No OS found   FvVol(45801e53-5...
Boot0004* UEFI Shell    FvVol(45801e53-5...
Boot0005* GRUB  HD(2,GPT,d810e6b2-9c8b-4...
```

## Automatic Update Snapshots

When using `omarchy-update` or `pacman -Syu`, snapshots will be created automatically and synced to the boot menu via the `limine-snapshot-sync-arm` script.

## Manual Snapshot Creation (optional)

> Note: Snapshots automatically appear in boot menu via the sync service we created earlier

```bash
sudo snapper -c root create --description "Description here"
```

Check that the new snapshot was automatically added to `/boot/EFI/BOOT/limine.conf`

```bash
cat /boot/EFI/BOOT/limine.conf
```

Look for the description of the manual snapshot you created just above.

## Troubleshooting

Skip this section if your VM booted to Limine properly.

If Limine shows a black screen with an error:

> No volume contained a Limine configuration file

Check that both files exist in the same directory

```bash
ls -la /boot/EFI/BOOT/BOOTAA64.EFI /boot/EFI/BOOT/limine.conf
```

Both should be present in /boot/EFI/BOOT/

If BOOTAA64.EFI is missing:

```bash
sudo mkdir -p /boot/EFI/BOOT
cd /tmp/limine
sudo install -m 0644 BOOTAA64.EFI /boot/EFI/BOOT/BOOTAA64.EFI
```

If `limine.conf` is missing, recreate it

> Note: the config must be in the same directory as BOOTAA64.EFI

```bash
sudo cp /boot/EFI/BOOT/limine.conf.bak /boot/EFI/BOOT/limine.conf
```

Or regenerate using the instructions above

Verify the boot entry points to the correct path:

```bash
sudo efibootmgr -v | grep Limine
```

It should show: `\EFI\BOOT\BOOTAA64.EFI`

# Configuring the `asahi-alarm` ARM mirror

> Before we can install Omarchy, we need to setup the asahi-alarm mirror, since a few package some from there on install.

⚠️⚠️⚠️ ONLY DO THIS ON M-SERIES (m1/m2) MACS RUNNING `asahi-alarm` ⚠️⚠️⚠️

## Setup the asahi-alarm mirror

Edit the `/etc/pacman.conf` file and add the \[asahi-alarm\] entry before any others.

```
sudo nvim /etc/pacman.conf
```

Add the `asahi-alarm` mirror as the first entry

```bash
[asahi-alarm]
Include = /etc/pacman.d/mirrorlist.asahi-alarm
```

Enter "insert mode" by pressing `i` (i for insert) then type in the mirror like so by hand. Press Escape when you're done typing.
![[CleanShot 2025-08-30 at 23.39.19@2x 1.png]]

Now save and quit with `:wq`
![[CleanShot 2025-08-30 at 22.20.10@2x.png]]

Before we install any packages, we need to add the `asahi-alarm` mirrorlist file with the following command:

```bash
sudo nvim /etc/pacman.d/mirrorlist.asahi-alarm
```

Then add the following in that file:

```
Server = https://github.com/asahi-alarm/asahi-alarm/releases/download/$arch
```

![[CleanShot 2025-08-30 at 23.10.55@2x.png]]

Now update the local package mirror databases with the following command:

```
sudo pacman -Syu
```

![[CleanShot 2025-08-30 at 23.44.49@2x.png]]

Install widevine

# Actually Installing Omarchy

We made it! Definitely take a snapshot in both Arch and Parallels at this point so that you have a fresh pre-Omarchy install attempt point to revert to.

## Install `wget`

```bash
sudo pacman -S wget
```

### For ARM64 installation, use the ARM fork

```bash
wget -qO- https://raw.githubusercontent.com/nilszeilon/armarchy/master/boot.sh | OMARCHY_REPO=jondkinney/armarchy OMARCHY_REF=vm-testing bash
```

Follow the prompts and good luck...
