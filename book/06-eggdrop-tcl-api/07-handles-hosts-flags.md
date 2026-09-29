# 7 — Handles, Hosts and Flags

A handle identifies an Eggdrop user record. Host patterns help Eggdrop associate IRC-visible users with records. Flags express privileges/capabilities.

None of these is equivalent to a nickname.

## Authorization pattern

```text
event
 -> Eggdrop resolves identity
 -> module asks for required privilege
 -> operation
```

Avoid copying authorization rules into ad-hoc string comparisons throughout a module.
