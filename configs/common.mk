# Brand
PRODUCT_BRAND ?= simpleaosp

# Local path for prebuilts
LOCAL_PATH := vendor/simpleaosp/prebuilts/common/system

# Add extra libs for the compilers to use graphite flag optimizations before any packages get built
export LD_LIBRARY_PATH := $(ANDROID_BUILD_TOP)/prebuilts/sm/lib
export LIBRARY_PATH := $(ANDROID_BUILD_TOP)/prebuilts/sm/lib

# Common build prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    keyguard.no_require_sim=true \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.delta.version=VERSION

# Common overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/simpleaosp/overlays/common

# Common packages
PRODUCT_PACKAGES += \
    busybox \
    CMFileManager \
    libscreenrecorder \
    LockClock \
    OpenDelta \
    ScreenRecorder \
    static_busybox \
    Trebuchet \
    unrar \
    zip

# Telephony packages for only telephony devices
ifneq ($(filter simpleaosp_hammerhead simpleaosp_mako simpleaosp_shamu,$(TARGET_PRODUCT)),)
 PRODUCT_PACKAGES += \
     CellBroadcastReceiver \
     Stk
endif

# Proprietary keyboard lib needed for swyping
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable sip+voip on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Blobs for media effects
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    $(LOCAL_PATH)/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Backuptool support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/addon.d/50-simpleaosp.sh:system/addon.d/50-simepleaosp.sh \
    $(LOCAL_PATH)/bin/backuptool.functions:system/bin/backuptool.functions \
    $(LOCAL_PATH)/bin/backuptool.sh:system/bin/backuptool.sh

# Init.d support with run-parts of busybox and support for adb over network
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bin/sysinit:system/bin/sysinit \
    $(LOCAL_PATH)/etc/init.local.rc:root/init.simpleAOSP.rc \
    $(LOCAL_PATH)/etc/init.d/999Sync:system/etc/init.d/999Sync

# Include bootanimation mk file
-include vendor/simpleaosp/configs/bootanimation.mk
