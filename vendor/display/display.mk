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

# EGL
PRODUCT_PROPERTY_OVERRIDES += ro.hardware.egl=meow

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.mediatek-mali

# PQ
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.mtk_pq_support=2

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.late.sf.duration=30000000 \
    debug.sf.late.app.duration=24000000 \
    debug.sf.early.sf.duration=30000000 \
    debug.sf.early.app.duration=24000000 \
    debug.sf.earlyGl.sf.duration=30000000 \
    debug.sf.earlyGl.app.duration=24000000 \
    debug.sf.hwc.min.duration=23000000 \
    debug.sf.disable_client_composition_cache=1 \
    debug.sf.enable_transaction_tracing=false \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.predict_hwc_composition_strategy=0

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libutils-v32.so

DEVICE_MANIFEST_FILE += \
    $(MTK_COMMON_PATH)/vendor/display/pq-manifest.xml

