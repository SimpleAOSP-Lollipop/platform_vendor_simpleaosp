#
# This policy configuration will be used by all products that
#

BOARD_SEPOLICY_DIRS += \
    vendor/simpleaosp/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    system.te \
    app.te \
    service_contexts \
    bootanim.te \
    zygote.te
