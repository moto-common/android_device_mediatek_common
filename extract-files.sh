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

HELPER=$(dirname $SCRIPT_LOCATION)"/extract_utils.sh"
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
        vendor/bin/hw/vendor.mediatek.hardware.mtkpower@1.0-service)
            ;&
        vendor/lib64/android.hardware.power-service-mediatek.so)
            "${PATCHELF}" --replace-needed "android.hardware.power-V2-ndk_platform.so" "android.hardware.power-V2-ndk.so" "${2}"
            ;;
        vendor/lib*/hw/vendor.mediatek.hardware.pq@2.*-impl.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
        vendor/lib*/hw/*/vendor.mediatek.hardware.pq@2.*-impl.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
        vendor/bin/hw/android.hardware.media.c2@1.2-mediatek)
            ;&
        vendor/bin/hw/android.hardware.media.c2@1.2-mediatek-64b)
           "$PATCHELF" --replace-needed libavservices_minijail_vendor.so libavservices_minijail.so "$2"
            ;;
    esac
}

# Get the COMPONENT, COMP_VERSION, and VENDOR from the current directory
CURRENT_DIR="$(pwd)"


# Extract the component version
if [[ "${CURRENT_DIR}" =~ /([0-9]+\.[0-9]+)$ ]] || [[ "${CURRENT_DIR}" =~ /(mt[0-9]+)$ ]]; then
    COMP_VERSION="/${BASH_REMATCH[1]}"
fi

if [ ! -z "${COMP_VERSION}" ]; then
    _COMPONENT=$(basename $(realpath "$CURRENT_DIR/.."))
else
    _COMPONENT=$(basename "$CURRENT_DIR")
fi

COMPONENT="${_COMPONENT}${COMP_VERSION}"

if [[ "$(basename $(realpath $CURRENT_DIR/../..))" == "system" ]] || \
   [[ "$(basename $(realpath $CURRENT_DIR/..))" == "system" ]] ; then
    VENDOR="mediatek/common/system"
elif [[ "$(basename $(realpath $CURRENT_DIR/../..))" == "vendor" ]] || \
   [[ "$(basename $(realpath $CURRENT_DIR/..))" == "vendor" ]] ; then
    VENDOR="mediatek/common/vendor"
fi

# Initialize the helper
if [ ! -z "${COMP_VERSION}" ]; then
    setup_vendor "${COMPONENT}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}" "${_COMPONENT}" true
else
    setup_vendor "${_COMPONENT}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}" "" true
fi

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" \
    "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
