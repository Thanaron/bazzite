#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

curl --output-dir "/etc/yum.repos.d/" --remote-name \
    "https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-${RELEASE}/solopasha-hyprland-fedora-${RELEASE}.repo"

rpm-ostree install \
    papirus-icon-theme \
    rsms-inter-fonts