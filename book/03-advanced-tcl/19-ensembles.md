# 19 — Ensembles and API Design

A namespace ensemble presents a family of subcommands through one command.

```tcl
namespace eval ::queue {
    namespace export push pop size
    namespace ensemble create
}
```

Clients can then use an API shaped like:

```tcl
queue push item
queue size
```

## Why ensembles matter

They provide a clean public command while implementation procedures remain organized in a namespace.

This style is common in Tcl and can be easier to discover than many unrelated global commands.

## API surface

Export only intended operations. A small API reduces coupling and makes later refactoring easier.

## Not isolation

An ensemble is dispatch and organization, not a privilege boundary.

## Command prefixes

An ensemble command can itself participate in command prefixes and callbacks, preserving Tcl's compositional model.

## Mastery

Design an ensemble for a bounded queue and identify which internal operations should remain private.
