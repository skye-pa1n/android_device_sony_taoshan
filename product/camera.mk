# Camera packages
PRODUCT_PACKAGES += \
    camera.qcom \
    libmm-qcamera

# Camera SHIM packages
PRODUCT_PACKAGES += \
    libshim_cald \
    libshim_camera

# Camera configurations
PRODUCT_COPY_FILES += \
    device/sony/taoshan/configs/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml

# Camera properties
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    camera.display.lmax=1280x720 \
    camera.display.umax=1920x1080 \
    camera.lowpower.record.enable=1 \
    media.camera.ts.monotonic=1 \
    persist.camera.gyro.disable=0 \
    persist.camera.isp.clock.optmz=0 \
    persist.camera.stats.test=5 \
    persist.vendor.qti.telephony.vt_cam_interface=1 \
    vidc.enc.dcvs.extra-buff-count=2 \
    persist.camera.HAL3.enabled=1
