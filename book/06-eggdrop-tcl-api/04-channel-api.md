# 4 — Channel API

Eggdrop owns substantial channel state. Prefer querying that state to maintaining a second unsynchronized copy.

Modules may still own feature-specific per-channel configuration.

Keep these separate:

```text
Eggdrop live channel state
module channel configuration
module ephemeral feature state
module persistent feature state
```

Reconnect and netsplit behavior become much easier to reason about when ownership is explicit.
