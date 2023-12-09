LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),mt6768)
include $(CLEAR_VARS)

DISPLAY_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell device/mediatek/common/make_symlinks.sh $(LOCAL_PATH) mt6768)))
$(DISPLAY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6768/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(DISPLAY_SYMLINK)

endif
