#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q stella | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/128x128/apps/stella.png
export DESKTOP=/usr/share/applications/stella.desktop
export STARTUPWMCLASS=stella
export USE_HOST_DRIVERS_EXPERIMENTAL=1

# Deploy dependencies
quick-sharun /usr/bin/stella

# Turn AppDir into AppImage
quick-sharun --make-appimage
