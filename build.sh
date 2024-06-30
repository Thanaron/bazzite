#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

for i in solopasha/hyprland rankyn/xivlauncher; do
    MAINTAINER="${i%%/*}"
    REPOSITORY="${i##*/}"
    curl --output-dir "/etc/yum.repos.d/" --remote-name \
    "https://copr.fedorainfracloud.org/coprs/${MAINTAINER}/${REPOSITORY}/repo/fedora-${RELEASE}/${MAINTAINER}-${REPOSITORY}-fedora-${RELEASE}.repo"
done
 

rpm-ostree install \
    papirus-icon-theme \
    rsms-inter-fonts \
    xivlauncher
