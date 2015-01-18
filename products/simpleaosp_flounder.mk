# Inherit AOSP device configuration for flounder
$(call inherit-product, device/htc/flounder/full_flounder.mk)

# Inherit common product files
$(call inherit-product, vendor/simpleaosp/configs/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := simpleaosp_flounder
PRODUCT_BRAND := google
PRODUCT_DEVICE := flounder
PRODUCT_MODEL := Nexus 9
PRODUCT_MANUFACTURER := htc

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="volantis" \
    BUILD_FINGERPRINT="google/volantis/flounder:5.0.1/LRX22C/1602158:user/release-keys" \
    PRIVATE_BUILD_DESC="volantis-user 5.0.1 LRX22C 1602158 release-keys"
