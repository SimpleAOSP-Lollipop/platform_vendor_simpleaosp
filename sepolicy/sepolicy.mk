#
# This policy configuration will be used by all products that
#

BOARD_SEPOLICY_DIRS += \
    vendor/simpleaosp/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bootanim.te \
    zygote.te
