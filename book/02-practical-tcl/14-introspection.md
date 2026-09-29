# 14 — Introspection with info

Tcl programs can inspect their runtime.

Examples include:

```tcl
info patchlevel
info commands
info procs
info vars
info globals
info locals
info args someProc
info body someProc
info script
info nameofexecutable
```

## Debugging versus architecture

Introspection is powerful for debugging, tooling, tests, plugin discovery, and compatibility checks. Do not use it to avoid defining a clear API.

## Runtime compatibility

Before depending on a Tcl feature, a program can inspect the runtime version and available commands/packages. This matters when software runs inside hosts such as Eggdrop, where the embedded Tcl environment may differ from a developer's standalone `tclsh`.

## Information exposure

Diagnostic commands can reveal implementation details, paths, loaded commands, or configuration. Do not expose unrestricted introspection to untrusted IRC users.

## Exercise

Write a diagnostic procedure that returns a deliberately limited dictionary containing Tcl patchlevel, executable, script path, and selected package information. Decide which fields belong in operator logs and which should never be public.
