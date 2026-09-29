# 14 — Command Dispatch Patterns

Large callbacks become difficult to authorize and test.

Prefer:

```text
Eggdrop callback
 -> parse command
 -> authorize operation
 -> service procedure
 -> render bounded response
```

Use a Tcl dictionary or explicit `switch` for dispatch. User text selects data in a table; it must not become Tcl source code.

Keep command aliases explicit.
