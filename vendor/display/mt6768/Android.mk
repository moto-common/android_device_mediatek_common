LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),mt6768)
include $(CLEAR_VARS)

DISPLAY_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(LOCAL_PATH)/symlinks.txt)))
$(DISPLAY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6768/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(DISPLAY_SYMLINK)

endif
