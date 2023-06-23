# Copyright 2023 Electimon
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

MTK_COMMON_PATH := device/mediatek/common
MTK_VENDOR_PATH := vendor/mediatek/common

# Utils
include $(MTK_COMMON_PATH)/utils.mk

# Components
include $(MTK_COMMON_PATH)/components.mk

# UEventD
PRODUCT_COPY_FILES += $(MTK_COMMON_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc
