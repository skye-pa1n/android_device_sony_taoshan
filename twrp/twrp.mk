# TWRP configurations
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.qcom

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(DEVICE_PATH)/twrp/twrp.fstab:recovery/root/etc/twrp.fstab

BOARD_USES_QC_TIME_SERVICES := true

TARGET_USES_LOGD := false

TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 51
TW_MAX_BRIGHTNESS := 255

TW_NO_SCREEN_BLANK := true

TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_KEY_LOC := "footer"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/userdata"

TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
TW_NO_USB_STORAGE := true
TW_USE_TOOLBOX := true

TW_HAS_NO_RECOVERY_PARTITION := true
TW_FLASH_FROM_STORAGE := true

TW_DEFAULT_EXTERNAL_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

TW_THEME := portrait_hdpi
TWRP_NEW_THEME := true
TW_IGNORE_ABS_MT_TRACKING_ID := true

HAVE_SELINUX := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
