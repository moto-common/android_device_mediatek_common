define add-prod-base-component
$(or \
  $(wildcard $(MTK_COMMON_PATH)/vendor/$(1)/$(1).mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(1)/$(1).mk) \
)
endef

define add-prod-board-component
$(or \
  $(wildcard $(MTK_COMMON_PATH)/vendor/$(1)/$(TARGET_BOARD_PLATFORM)/$(1).mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(TARGET_BOARD_PLATFORM)/$(1).mk) \
)
endef

define add-prod-kernel-component
$(or \
  $(wildcard $(MTK_COMMON_PATH)/vendor/$(1)/$(TARGET_KERNEL_VERSION)/$(1).mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(TARGET_KERNEL_VERSION)/$(1).mk) \
)
endef

define add-board-base-component
$(or \
  $(wildcard $(MTK_COMMON_PATH)/vendor/$(1)/board.mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/board.mk) \
)
endef

define add-board-board-component
$(or \
  $(wildcard $(MTK_COMMON_PATH)/vendor/$(1)/$(TARGET_BOARD_PLATFORM)/board.mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(TARGET_BOARD_PLATFORM)/board.mk) \
)
endef

define add-board-kernel-component
$(or \
  $(wildcard $(MTK_COMMON_PATH)/vendor/$(1)/$(TARGET_KERNEL_VERSION)/board.mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(TARGET_KERNEL_VERSION)/board.mk) \
)
endef

define add-vendor-base-component
$(or \
  $(wildcard $(MTK_VENDOR_PATH)/vendor/$(component)/$(component)-vendor.mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(component)/$(component)-vendor.mk) \
)
endef

define add-vendor-board-component
$(or \
  $(wildcard $(MTK_VENDOR_PATH)/vendor/$(component)/$(TARGET_BOARD_PLATFORM)/$(component)-vendor.mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(component)/$(TARGET_BOARD_PLATFORM)/$(component)-vendor.mk) \
)
endef

define add-vendor-kernel-component
$(or \
  $(wildcard $(MTK_VENDOR_PATH)/vendor/$(component)/$(TARGET_KERNEL_VERSION)/$(component)-vendor.mk), \
  $(wildcard $(MTK_COMMON_PATH)/system/$(component)/$(TARGET_KERNEL_VERSION)/$(component)-vendor.mk) \
)
endef
