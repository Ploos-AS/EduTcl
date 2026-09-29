# 16 — ISUPPORT / 005

The server can advertise network-specific capabilities and limits through numeric 005, commonly called ISUPPORT.

Tokens can describe nickname/channel limits, channel prefixes, status prefixes, channel mode categories, casemapping and other network features.

## Configuration learned from the server

Some protocol behavior is discovered at runtime. Store parsed ISUPPORT tokens in connection/network state rather than scattering assumptions through modules.

A token may look like `KEY`, `KEY=value` or `-KEY`. Preserve enough information to distinguish presence, value and removal.

Advertised limits can guide resource bounds, but remote configuration should still be validated before it controls allocations or algorithms.

## Mastery

Explain why a reusable IRC library should not hard-code one network's CHANTYPES, PREFIX or CASEMAPPING.
