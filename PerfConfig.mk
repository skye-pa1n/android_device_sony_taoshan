# Legacy hacks
MALLOC_SVELTE := true
TARGET_NEEDS_GCC_LIBC := true
TARGET_USES_MEDIA_EXTENSIONS := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
    WITH_DEXPREOPT_PIC := true
    ifneq ($(TARGET_BUILD_VARIANT),user)
      # Retain classes.dex in APK's for non-user builds
      DEX_PREOPT_DEFAULT := nostripping
    endif
  endif
endif

# Set lowram options
PRODUCT_PROPERTY_OVERRIDES += \
     ro.config.low_ram=false \
     ro.lmk.critical_upgrade=true \
     ro.lmk.upgrade_pressure=40 \
     ro.lmk.downgrade_pressure=60 \
     ro.lmk.kill_heaviest_task=false \
     ro.statsd.enable=false

# set threshold to filter unused apps
PRODUCT_PROPERTY_OVERRIDES += \
     pm.dexopt.downgrade_after_inactive_days=10

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Always preopt extracted APKs to prevent extracting out of the APK for gms
# modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Use a profile based boot image for this device. Note that this is currently a
# generic profile and not Android Go optimized.
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# set the compiler filter for shared apks to quicken.
# Rationale: speed has a lot of dex code expansion, it uses more ram and space
# compared to quicken. Using quicken for shared APKs on Go devices may save RAM.
# Note that this is a trade-off: here we trade clean pages for dirty pages,
# extra cpu and battery. That's because the quicken files will be jit-ed in all
# the processes that load of shared apk and the code cache is not shared.
# Some notable apps that will be affected by this are gms and chrome.
# b/65591595.
PRODUCT_PROPERTY_OVERRIDES += \
     pm.dexopt.shared=quicken

# Default heap sizes. Allow up to 256m for large heaps to make sure a single app
# doesn't take all of the RAM.
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=128m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=360m

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# lmkd can kill more now.
PRODUCT_PROPERTY_OVERRIDES += \
     ro.lmk.medium=700 \

# madvise random in ART to reduce page cache thrashing.
PRODUCT_PROPERTY_OVERRIDES += \
     dalvik.vm.madvise-random=true
