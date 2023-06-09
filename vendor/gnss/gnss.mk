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

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-mediatek \
    android.hardware.gnss-impl-mediatek \
    android.hardware.gnss-service.mediatek

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.mtk_log_hide_gps=1

# Vendor
$(call inherit-product, vendor/mediatek/common/vendor/gnss/gnss-vendor.mk)
