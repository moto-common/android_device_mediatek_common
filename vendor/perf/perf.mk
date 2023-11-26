# Copyright 2023 Electimon.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor \
    vendor.mediatek.hardware.mtkpower@1.2.vendor

# Configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(MTK_COMMON_PATH)/vendor/perf/configs/$(TARGET_BOARD_PLATFORM)/,$(TARGET_COPY_OUT_VENDOR)/etc)

# VINTF
DEVICE_MANIFEST_FILE += \
    $(MTK_COMMON_PATH)/vendor/perf/perf-manifest.xml
