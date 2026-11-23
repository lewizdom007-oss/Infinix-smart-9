# X6532 local BoardConfig entry point.
# The workflow renames the upstream reference BoardConfig.mk to
# BoardConfig.upstream.mk before applying this repository overlay.
#
# This preserves all reference flags while making this file the editable
# local entry point. Add verified overrides below only after validating them
# against the supplied X6532 firmware and the selected TWRP branch.

DEVICE_PATH := device/infinix/X6532
include $(DEVICE_PATH)/BoardConfig.upstream.mk

# Firmware audit note:
# Extracted stock FDT payload = 163667 bytes.
# Reference BoardConfig.upstream.mk declares BOARD_DTB_SIZE := 161454.
# Do NOT override this until vendor_boot v4 mkbootimg semantics are confirmed.
