# 13 — Command prefixes and callbacks

A callback does not need to be represented as source code.

A **command prefix** is a list containing a command name and optionally some leading arguments.

```tcl
proc greet {prefix nick} {
    return "$prefix, $nick"
}

set callback [list greet Hello]
puts [{*}$callback Alice]
```

The final invocation structurally expands the prefix and supplies the event argument.

## Why prefixes scale

Command prefixes can represent:

- a procedure;
- a namespaced procedure;
- a procedure with pre-bound context;
- later, an object method command.

They let APIs accept behavior without requiring callers to construct Tcl source strings.

## Callback contracts

Document:

- arguments supplied by the framework;
- expected return value;
- possible errors;
- whether the callback may retain state;
- whether invocation is synchronous or event-driven.

## Eggdrop preview

Eggdrop binds eventually invoke Tcl callbacks according to defined signatures. Understanding callbacks as commands with explicit contracts makes those APIs much less magical.

## TiCle direction

A routing or event layer can store command prefixes as data and invoke them with `{*}`. We will inspect TiCle's actual design before claiming that it uses any specific mechanism.
