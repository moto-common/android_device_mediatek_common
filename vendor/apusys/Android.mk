LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),mt6879)
include $(CLEAR_VARS)

APUSYS_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(LOCAL_PATH)/symlinks.txt)))
$(APUSYS_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6879/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(APUSYS_SYMLINK)

endif

