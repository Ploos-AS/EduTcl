# 11 — Callback Contracts

Every bind type defines a callback contract: argument order, meanings and return behavior.

Treat that contract like an API.

## Adapter pattern

A strong module often has:

```text
Eggdrop callback
 -> normalize/validate context
 -> ordinary Tcl procedure
 -> result
 -> Eggdrop output adapter
```

This makes most behavior testable without Eggdrop.

## Avoid accidental coupling

Do not let every internal function accept five historical callback arguments merely because the first entry point does.
