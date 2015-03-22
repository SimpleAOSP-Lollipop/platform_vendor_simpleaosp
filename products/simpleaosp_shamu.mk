# Inherit AOSP device configuration for mako
$(call inherit-product, device/moto/shamu/full_shamu.mk)

# Inherit common product files
$(call inherit-product, vendor/simpleaosp/configs/common.mk)

# Setup device specific product configuration
PRODUCT_NAME := simpleaosp_shamu
PRODUCT_BRAND := google
PRODUCT_DEVICE := shamu
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola

# Build prop fingerprint overrides
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME="shamu" BUILD_FINGERPRINT="google/shamu/shamu:5.1/LMY47E/1748839:user/release-keys" PRIVATE_BUILD_DESC="shamu-user 5.1 LMY47E 1748839 release-keys"
