#
# This policy configuration will be used by all products that
# from SimpleAOSP
#

BOARD_SEPOLICY_DIRS += \
    vendor/simpleaosp/sepolicy

BOARD_SEPOLICY_UNION += \
    auditd.te \
    app.te \
    bootanim.te \
    file_contexts \
    file.te \
    mediaserver.te \
    service_contexts \
    system.te \
    zygote.te
