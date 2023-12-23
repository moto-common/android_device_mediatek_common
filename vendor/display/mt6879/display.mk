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
    debug.sf.hwc.min.duration=2000000 \
    debug.sf.predict_hwc_composition_strategy=0 \
    debug.sf.region_sampling_period_ns=1000000000 \
    ro.hardware.hwcomposer=mtk_common \
    ro.hardware.gralloc=common \
    ro.hardware.vulkan=mali \
    ro.surface_flinger.uclamp.min=190 \
    vendor.debug.sf.cpupolicy=1 \
    vendor.debug.sf.cpupolicy.upbound_uclamp_min=350 \
    vendor.debug.sf.cpupolicy.max_correct_offset=100 \
    vendor.debug.sf.cpupolicy.rt_bl_min=231 \
    vendor.debug.sf.cpupolicy.base_min_bl=250 \
    vendor.debug.sf.cpupolicy.sf_cpu_thres=230 \
    vendor.debug.sf.cpupolicy.upbound_uclamp_max_ll=170 \
    vendor.debug.sf.cpupolicy.hw_comp_suspend=1 \
    vendor.debug.sf.cpupolicy.hw_hfr_suspend=1 \
    vendor.debug.sf.cpupolicy.xgf_min=25 \
    vendor.debug.sf.cpupolicy.min_60_mml=95 \
    vendor.debug.sf.cpupolicy.min_30_mml=95 \
    vendor.debug.sf.cpupolicy.lowbound_uclamp_min=95 \
    vendor.debug.sf.cpupolicy.upbound_uclamp_ret_sys=145 \
    vendor.debug.sf.cpupolicy.min_60=75 \
    vendor.debug.sf.cpupolicy.min_90=95 \
    vendor.debug.sf.cpupolicy.min_120=95 \
    vendor.debug.sf.cpupolicy.min_boost=95 \
    vendor.debug.sf.cpupolicy.power_up_120=-300000 \
    vendor.debug.sf.cpupolicy.power_down_120=300000 \
    vendor.debug.sf.cpupolicy.re_hfr=0

DEVICE_MANIFEST_FILE += \
    $(MTK_COMMON_PATH)/vendor/display/$(TARGET_BOARD_PLATFORM)/display-manifest.xml
