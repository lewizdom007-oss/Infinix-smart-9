# Infinix Smart 9 (X6532) — TWRP bring-up

This repository is the working area for porting Team Win Recovery Project (TWRP) to the Infinix Smart 9 X6532.

## Device baseline verified from supplied firmware

- Device: Infinix Smart 9 X6532
- SoC: MediaTek MT6768
- Android: 12 / API 31
- Firmware build: 241012V2199
- Stock kernel: 5.10.209-android12-9-00016-g7c6bbcca33e1-ab12029497
- Boot header: v4
- Initial output target: `vendor_boot.img`

## Important status

**Bring-up workspace only — not a tested or flashable recovery.**

The stock firmware DTB extracted from the supplied `vendor_boot.img` is 163,667 bytes. The reference `ofox` device tree currently declares `BOARD_DTB_SIZE := 161454`. That discrepancy must be resolved against the actual mkbootimg/vendor_boot packaging rules before flashing.

The reference device tree is available at:
https://github.com/naden01/infinix_X6532/tree/ofox

Its README contains stale Tecno KL5 wording even though the product makefiles target X6532. Treat the README and inherited build flags as unverified until the build and device tests prove them.

## Build strategy

1. Keep the stock 5.10 kernel; do not introduce a kernel 6.x/GKI change during the first recovery bring-up.
2. Build the recovery ramdisk for the vendor_boot v4 layout.
3. Validate the produced image structure and partition size before any flash.
4. Test boot, display/touch, ADB, mount, encryption/decryption, backup/restore, and reboot paths separately.
5. Keep a known-good stock boot/vendor_boot backup and a tested rollback path.

## Repository layout

- `device/infinix/X6532/`: editable device configuration and firmware-derived references.
- `.github/workflows/`: CI build automation.
- `docs/`: extraction facts, validation notes, and test checklist.

No successful build or device boot is claimed yet.