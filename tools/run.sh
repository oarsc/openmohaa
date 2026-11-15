#!/bin/sh
set -eu

GAME_DIR="/mohaa/data"
INSTALL_DIR="/mohaa/build/install"
LAUNCHER="launch_openmohaa_base"

if [ "$#" -gt 0 ]; then
    case "$1" in
        sh)
            LAUNCHER="launch_openmohaa_spearhead"
            shift
            ;;
        bt)
            LAUNCHER="launch_openmohaa_breakthrough"
            shift
            ;;
    esac
fi

exec "${INSTALL_DIR}/lib/openmohaa/${LAUNCHER}" \
    +set fs_basepath "${GAME_DIR}" "$@"
