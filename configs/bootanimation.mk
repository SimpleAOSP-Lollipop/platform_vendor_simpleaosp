# Local path for bootanimation prebuilts
LOCAL_PATH := vendor/simpleaosp/prebuilts/bootanimation/system/media

# Get the right bootanimation for device
ifneq ($(filter simpleaosp_flo,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/flo-bootanimation.zip
endif

ifneq ($(filter simpleaosp_flounder,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/flounder-bootanimation.zip
endif

ifneq ($(filter simpleaosp_hammerhead,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/hammerhead-bootanimation.zip
endif

ifneq ($(filter simpleaosp_mako,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/mako-bootanimation.zip
endif

ifneq ($(filter simpleaosp_shamu,$(TARGET_PRODUCT)),)
PRODUCT_BOOTANIMATION := $(LOCAL_PATH)/shamu-bootanimation.zip
endif
