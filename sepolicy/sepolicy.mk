#
# This policy configuration will be used by all products that
# from SimpleAOSP
#

BOARD_SEPOLICY_DIRS += \
    vendor/simpleaosp/sepolicy

BOARD_SEPOLICY_UNION += \
    auditd.te \
    file.te \
    file_contexts \
    mac_permissions.xml \
    service_contexts \
    system.te
