#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl --output-dir "/etc/yum.repos.d/" --remote-name \
    "https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-${RELEASE}/solopasha-hyprland-fedora-${RELEASE}.repo"

curl -o /etc/pki/rpm-gpg/1password.asc https://downloads.1password.com/linux/keys/1password.asc

cat > /etc/yum.repos.d/1password.repo << EOF
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/1password.asc
EOF

rpm-ostree install \
            1password \
            1password-cli \
            papirus-icon-theme \
            rsms-inter-fonts