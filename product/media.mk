# Media configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

# Media properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.ccodec=0
