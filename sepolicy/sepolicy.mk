#
# This policy configuration will be used by all products that
# from SimpleAOSP
#

BOARD_SEPOLICY_DIRS += \
    vendor/simpleaosp/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    service_contexts
