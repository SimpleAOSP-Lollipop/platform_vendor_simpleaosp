# Inherit AOSP device configuration for mako
$(call inherit-product, device/lge/mako/full_mako.mk)

# Inherit common product files
$(call inherit-product, vendor/simpleaosp/configs/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := simpleaosp_mako
PRODUCT_BRAND := google
PRODUCT_DEVICE := mako
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="occam" \
    BUILD_FINGERPRINT="google/occam/mako:5.0.1/LRX22C/1602158:user/release-keys" \
    PRIVATE_BUILD_DESC="occam-user 5.0.1 LRX22C 1602158 release-keys"
