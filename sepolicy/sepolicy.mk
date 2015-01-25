#
# This policy configuration will be used by all products that
# inherit from SimpleAOSP
#

BOARD_SEPOLICY_DIRS += \
    vendor/simpleaosp/sepolicy

BOARD_SEPOLICY_UNION += \
    auditd.te \
    app.te \
    bootanim.te \
    drmserver.te \
    file.te \
    file_contexts \
    mac_permissions.xml \
    mediaserver.te \
    seapp_contexts \
    service_contexts \
    system.te \
    zygote.te
