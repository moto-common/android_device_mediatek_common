LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),mt6833)
include $(CLEAR_VARS)

DISPLAY_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell device/mediatek/common/make_symlinks.sh $(LOCAL_PATH) mt6833)))
$(DISPLAY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6833/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(DISPLAY_SYMLINK)

endif
