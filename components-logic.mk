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
COMPONENT_INCLUDES := $(foreach component,$(COMPONENTS),include $(MTK_COMMON_PATH)/vendor/$(component)/$(component).mk)

# All handling
ifneq (,$(filter all, $(TARGET_COMMON_MTK_COMPONENTS)))
TARGET_COMMON_MTK_COMPONENTS := \
    $(COMPONENTS) \
    $(filter-out all,$(TARGET_COMMON_MTK_COMPONENTS))
endif

# Generate the include directives for each component
COMPONENT_PROD_INCLUDES := $(foreach component,$(COMPONENTS),$(if $(and $(filter $(component),$(TARGET_COMMON_MTK_COMPONENTS)),\
    $(wildcard $(MTK_COMMON_PATH)/vendor/$(component)/$(TARGET_KERNEL_VERSION)/$(component).mk)),\
    $(MTK_COMMON_PATH)/vendor/$(component)/$(TARGET_KERNEL_VERSION)/$(component).mk,\
    $(if $(wildcard $(MTK_COMMON_PATH)/vendor/$(component)/$(component).mk),\
        $(MTK_COMMON_PATH)/vendor/$(component)/$(component).mk)))

COMPONENT_BOARD_INCLUDES := $(foreach component,$(COMPONENTS),$(if $(and $(filter $(component),$(TARGET_COMMON_MTK_COMPONENTS)),\
    $(wildcard $(MTK_COMMON_PATH)/vendor/$(component)/$(TARGET_KERNEL_VERSION)/board.mk)),\
    $(MTK_COMMON_PATH)/vendor/$(component)/$(TARGET_KERNEL_VERSION)/board.mk,\
    $(if $(wildcard $(MTK_COMMON_PATH)/vendor/$(component)/board.mk),\
        $(MTK_COMMON_PATH)/vendor/$(component)/board.mk)))

VENDOR_PROD_INCLUDES := $(foreach component,$(COMPONENTS),$(if $(and $(filter $(component),$(TARGET_COMMON_MTK_COMPONENTS)),\
    $(wildcard $(MTK_VENDOR_PATH)/vendor/$(component)/$(TARGET_KERNEL_VERSION)/$(component)-vendor.mk)),\
    $(MTK_VENDOR_PATH)/vendor/$(component)/$(TARGET_KERNEL_VERSION)/$(component)-vendor.mk,\
    $(if $(wildcard $(MTK_VENDOR_PATH)/vendor/$(component)/$(component).mk),\
        $(MTK_VENDOR_PATH)/vendor/$(component)/$(component).mk)))
