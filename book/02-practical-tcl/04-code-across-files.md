# 4 — Organizing code across files

Tcl can evaluate another file with `source`:

```tcl
source helpers.tcl
```

For real projects, resolve paths deliberately rather than assuming the current working directory.

```tcl
set here [file dirname [file normalize [info script]]]
source [file join $here helpers.tcl]
```

## Working directory is not script directory

A program may be launched from anywhere. Relative paths interpreted against the process working directory can therefore break unexpectedly.

## One-way dependencies

Prefer a comprehensible dependency direction. Circular chains of `source` calls make initialization order difficult to understand.

## Bootstrap files

A small entry point can determine its own location, load required components, configure the application, and start it.

## Security

A filename is data. Never turn untrusted IRC text into a path to `source`. Loading Tcl source executes Tcl code and is therefore a code-execution boundary.

## Exercise

Split a small program into an entry point and two namespace-owned modules. Run the entry point from a different working directory and verify that it still loads correctly.
