# Inherit AOSP device configuration for manta
$(call inherit-product, device/samsung/manta/aosp_manta.mk)

# Inherit common product files
$(call inherit-product, vendor/simpleaosp/configs/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := simpleaosp_manta
PRODUCT_BRAND := google
PRODUCT_DEVICE := manta
PRODUCT_MODEL := Nexus 10
PRODUCT_MANUFACTURER := samsung

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="mantaray" \
    BUILD_FINGERPRINT="google/mantaray/manta:5.0.2/LRX22G/1649326:user/release-keys" \
    PRIVATE_BUILD_DESC="mantaray-user 5.0.2 LRX22G 1649326 release-keys"
