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
    $(MTK_COMMON_PATH)/vendor/wlan/vendor_hals.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/vendor_hals/vendor_hals.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.sap.concurrent.iface=ap1 \
    ro.vendor.wifi.sap.interface=ap0

# WMT
ifeq ($(TARGET_BOARD_PLATFORM),mt6768)
 $(call inherit-product, vendor/mediatek/common/vendor/wmt/wmt-vendor.mk)
else ifeq ($(TARGET_BOARD_PLATFORM),mt6879)
 $(call inherit-product, vendor/mediatek/common/vendor/connac2x/connac2x-vendor.mk)
endif
