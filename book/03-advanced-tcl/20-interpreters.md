# 20 — Interpreters and Execution Boundaries

A Tcl process can contain multiple interpreters.

```tcl
set child [interp create]
interp eval $child {expr {20 + 22}}
interp delete $child
```

Each interpreter has its own commands and variables. This is fundamentally different from merely creating another namespace.

## Aliases

A parent can deliberately expose selected operations to a child through aliases. That creates a capability-like API.

The design question becomes: what is the minimum authority the child actually needs?

## Data crossing boundaries

Treat values crossing interpreter boundaries deliberately. Do not assume a separate interpreter makes arbitrary host callbacks harmless.

## Lifecycle

Delete child interpreters when their work is complete. Track aliases and external resources granted to them.

## Security boundary versus process boundary

Interpreter separation can restrict Tcl-level capabilities, but it is not identical to OS process isolation. The threat model determines whether interpreter isolation is sufficient.

## Mastery

Explain the difference between a namespace, an object, an interpreter and a separate operating-system process.
