# TWRP configurations
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(DEVICE_PATH)/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 51
TW_MAX_BRIGHTNESS := 255

TW_THEME := portrait_hdpi
TWRP_NEW_THEME := true

TW_INCLUDE_CRYPTO := true
TW_USE_TOOLBOX := true

HAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
