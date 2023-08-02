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

# Generating lists
EXCL := Android.mk
COMPONENTS := $(filter-out $(EXCL), $(notdir $(wildcard $(MTK_COMMON_PATH)/vendor/*)))
COMPONENTS += $(filter-out $(EXCL), $(notdir $(wildcard $(MTK_COMMON_PATH)/system/*)))

# Utils
include $(MTK_COMMON_PATH)/components-utils.mk

# All handling
ifneq (,$(filter all, $(TARGET_COMMON_MTK_COMPONENTS)))
TARGET_COMMON_MTK_COMPONENTS := \
    $(COMPONENTS) \
    $(filter-out all,$(TARGET_COMMON_MTK_COMPONENTS))
endif

# Generate the include directives for each component
COMPONENT_BOARD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-board-base-component,$(component)))
COMPONENT_BOARD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-board-board-component,$(component)))
COMPONENT_BOARD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-board-kernel-component,$(component)))
COMPONENT_BOARD_INCLUDES := $(sort $(COMPONENT_BOARD_INCLUDES))

COMPONENT_PROD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-prod-base-component,$(component)))
COMPONENT_PROD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-prod-board-component,$(component)))
COMPONENT_PROD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-prod-kernel-component,$(component)))
COMPONENT_PROD_INCLUDES := $(sort $(COMPONENT_PROD_INCLUDES))

VENDOR_PROD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-vendor-base-component,$(component)))
VENDOR_PROD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-vendor-board-component,$(component)))
VENDOR_PROD_INCLUDES += $(foreach component,$(TARGET_COMMON_MTK_COMPONENTS),$(call add-vendor-kernel-component,$(component)))
VENDOR_PROD_INCLUDES := $(sort $(VENDOR_PROD_INCLUDES))
