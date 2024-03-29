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
if [ ! -z ${COMP_VERSION} ]; then
    setup_vendor "${COMPONENT}" "${VENDOR}" "${ANDROID_ROOT}" false true "${_COMPONENT}" true
else
    setup_vendor "${_COMPONENT}" "${VENDOR}" "${ANDROID_ROOT}" false true "" true
fi

# Warning headers and guards
write_headers

# The standard common blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Finish
write_footers
