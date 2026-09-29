# 20 — Namespaces and Module Structure

A serious script should not scatter procedures and variables across the global namespace.

Use one namespace per module and expose a small lifecycle surface:

```tcl
::module::init
::module::shutdown
```

Keep callbacks, state and helpers beneath that namespace.

This pattern prepares us for larger Eggdrop scripts and for TiCle's explicit module lifecycle later.
