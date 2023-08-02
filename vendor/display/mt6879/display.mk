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

# Global Display Configuration
include $(MTK_COMMON_PATH)/vendor/display/display.mk

PRODUCT_COPY_FILES += \
    $(MTK_COMMON_PATH)/vendor/display/mt6879/android.hardware.graphics.allocator@4.0-service-mediatek.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.graphics.allocator@4.0-service-mediatek.rc

PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.late.sf.duration=15111111 \
    debug.sf.late.app.duration=17222222 \
    debug.sf.early.sf.duration=15111111 \
    debug.sf.early.app.duration=17222222 \
    debug.sf.earlyGl.sf.duration=15111111 \
    debug.sf.earlyGl.app.duration=17222222 \
    debug.sf.hwc.min.duration=0 \
    ro.hardware.hwcomposer=mtk_common \
    ro.hardware.gralloc=common

DEVICE_MANIFEST_FILE += \
    $(MTK_COMMON_PATH)/vendor/display/$(TARGET_BOARD_PLATFORM)/display-manifest.xml
