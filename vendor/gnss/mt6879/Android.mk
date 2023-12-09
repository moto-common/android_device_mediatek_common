LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM),mt6879)
include $(CLEAR_VARS)

GNSS_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell device/mediatek/common/make_symlinks.sh $(LOCAL_PATH) mt6879)))
$(GNSS_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6879/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(GNSS_SYMLINK)
endif
