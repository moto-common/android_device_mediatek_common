#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
# Copyright (C) 2020 Paranoid Android
# Copyright (C) 2023 Electimon
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

SCRIPT_LOCATION=$(readlink -f "${BASH_SOURCE[0]}")
ANDROID_ROOT=$(dirname $SCRIPT_LOCATION)"/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/lib64/libwifi-hal-mtk.so)
            "${PATCHELF}" --set-soname "libwifi-hal-mtk.so" "${2}"
            ;;
        vendor/lib*/hw/vendor.mediatek.hardware.pq@2.15-impl.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
    esac
}

# Get the COMPONENT, KERNEL_VERSION, and VENDOR from the current directory
CURRENT_DIR="$(pwd)"
if [[ "$(basename $(realpath $CURRENT_DIR/../..))" == "system" ]] || \
   [[ "$(basename $(realpath $CURRENT_DIR/..))" == "system" ]] ; then
    VENDOR="mediatek/common/system"
elif [[ "$(basename $(realpath $CURRENT_DIR/../..))" == "vendor" ]] || \
   [[ "$(basename $(realpath $CURRENT_DIR/..))" == "vendor" ]] ; then
    VENDOR="mediatek/common/vendor"
fi

# Extract the kernel version if it follows the format x.y
if [[ "${CURRENT_DIR}" =~ /([0-9]+\.[0-9]+)$ ]]; then
    KERNEL_VERSION="${BASH_REMATCH[1]}"
fi

if [ ! -z "${KERNEL_VERSION}" ]; then
    COMPONENT=$(basename $(realpath "$CURRENT_DIR/.."))
else
    COMPONENT=$(basename "$CURRENT_DIR")
fi

echo $COMPONENT
echo $VENDOR
# Initialize the helper
if [ ! -z "${KERNEL_VERSION}" ]; then
    setup_vendor "${COMPONENT}/${KERNEL_VERSION}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}" "${COMPONENT}" true
else
    setup_vendor "${COMPONENT}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}" "" true
fi

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" \
    "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
