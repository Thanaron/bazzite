#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl --output-dir "/etc/yum.repos.d/" --remote-name \
    "https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-${RELEASE}/solopasha-hyprland-fedora-${RELEASE}.repo"

curl --output-dir "/etc/yum.repos.d/" --remote-name \
    "https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm"

curl --output-dir "/etc/yum.repos.d/" --remote-name \
    "https://downloads.1password.com/linux/rpm/stable/x86_64/1password-cli-latest.x86_64.rpm"

rpm-ostree install \
            1password \
            1password-cli \
            papirus-icon-theme \
            rsms-inter-fonts