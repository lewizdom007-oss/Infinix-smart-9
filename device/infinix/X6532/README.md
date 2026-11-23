# X6532 device tree integration

This folder documents the device tree used by CI. The current build workflow obtains the complete reference tree from:

- Repository: https://github.com/naden01/infinix_X6532
- Reference branch: `ofox`
- Product: `twrp_X6532`

The upstream tree is used as the initial build baseline because it contains device-specific recovery assets and vendor module configuration that must not be recreated from incomplete snippets.

Before promoting this reference into a self-contained tree in this repository, audit the files listed in `../../docs/known-issues.md`. In particular, verify the DTB packaging discrepancy and all dependencies referenced by BoardConfig.

Do not treat the reference tree as verified solely because it has a successful build.