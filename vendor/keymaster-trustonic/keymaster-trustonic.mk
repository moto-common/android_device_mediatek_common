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

# Packages
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.0.vendor \
    android.hardware.keymaster@4.1.vendor \
    libkeymaster4.vendor \
    libkeymaster41.vendor \
    libkeymaster4_1support.vendor

DEVICE_MANIFEST_FILE += \
    $(MTK_COMMON_PATH)/vendor/keymaster-trustonic/gatekeeper-manifest.xml \
    $(MTK_COMMON_PATH)/vendor/keymaster-trustonic/keymaster-manifest.xml \
    $(MTK_COMMON_PATH)/vendor/keymaster-trustonic/trustonic-manifest.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.kmsetkey=trustonic \
    ro.hardware.gatekeeper=trustonic \
    ro.vendor.mtk_trustonic_tee_support=1
