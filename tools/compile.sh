#!/bin/sh
set -eu

BUILD_DIR="/mohaa/build"
INSTALL_DIR="${BUILD_DIR}/install"

cmake -S /mohaa -B "${BUILD_DIR}" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}"
cmake --build "${BUILD_DIR}" -j"$(nproc)"
cmake --install "${BUILD_DIR}"
