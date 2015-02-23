# Copyright (C) 2015 SimpleAOSP Project
# Copyright (C) 2015 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Brand
PRODUCT_BRAND ?= simpleaosp

# Local path for prebuilts
LOCAL_PATH := vendor/simpleaosp/prebuilts/common/system

# Block based ota zip default to off
TARGET_USES_BLOCK_BASED_OTA := false

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
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.delta.version=VERSION

# Common overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/simpleaosp/overlays/common

# Common packages
PRODUCT_PACKAGES += \
    Launcher3 \
    libscreenrecorder \
    LockClock \
    OpenDelta \
    ScreenRecorder

# Telephony packages for only telephony devices
ifneq ($(filter simpleaosp_hammerhead simpleaosp_mako simpleaosp_shamu,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += Stk
endif

# Layers theme
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/app/Layers/Layers.apk:system/app/Layers/Layers.apk \
    $(LOCAL_PATH)/etc/permissions/com.layers.theme.xml:system/etc/permissions/com.layers.theme.xml

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
    $(LOCAL_PATH)/bin/backuptool.functions:install/bin/backuptool.functions \
    $(LOCAL_PATH)/bin/backuptool.sh:install/bin/backuptool.sh

# Get the right bootanimation for each device
ifneq ($(filter simpleaosp_flo,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/media/flo-bootanimation.zip
endif

ifneq ($(filter simpleaosp_flounder,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/media/flounder-bootanimation.zip
endif

ifneq ($(filter simpleaosp_hammerhead,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/media/hammerhead-bootanimation.zip
endif

ifneq ($(filter simpleaosp_mako,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/media/mako-bootanimation.zip
endif

ifneq ($(filter simpleaosp_shamu,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/media/shamu-bootanimation.zip
endif

# Include chromium prebuilt if opted in
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif
