# Initial audit — known risks

1. **DTB size mismatch:** stock extraction reports 163,667 bytes; reference BoardConfig reports 161,454 bytes.
2. **Stale documentation:** reference branch README says Tecno Spark 30C (KL5), while its product makefiles identify X6532.
3. **Unverified fstab:** logical partition names, EROFS/ext4 alternatives, metadata block path, userdata encryption flags, and slot assumptions must be compared with the exact installed firmware.
4. **Vendor modules:** 186 kernel modules were found in the stock vendor ramdisk. Their exact load order, dependencies, and destination must be preserved and checked.
5. **Touch/display:** panel and touch modules are device-specific. Booting to a UI is not guaranteed merely because compilation succeeds.
6. **Encryption:** FBE/keymaster/Trustonic dependencies require real-device validation. A successful mount of non-encrypted partitions does not prove /data decryption.
7. **Haptics:** no working vibration claim is made.
8. **Image safety:** no artifact from CI is considered flash-ready until vendor_boot v4 structure and partition-size checks pass.

## Required validation sequence

- Parse the generated vendor_boot with `unpack_bootimg`.
- Compare header version, page size, vendor ramdisk fragments, DTB and command line to stock.
- Confirm image size is within the actual vendor_boot partition capacity.
- Boot using a non-destructive method where supported, retaining stock images for rollback.
- Test display, touch, buttons, ADB, MTP, mounts, decryption, backup/restore, and reboot individually.