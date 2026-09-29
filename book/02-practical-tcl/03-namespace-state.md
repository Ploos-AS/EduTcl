# 3 — Namespace variables and state ownership

A namespace can own variables.

```tcl
namespace eval ::counter {
    variable value 0
}

proc ::counter::increment {} {
    variable value
    incr value
}

proc ::counter::get {} {
    variable value
    return $value
}
```

Inside a procedure, `variable value` links the local name to the namespace variable. Compare this with M1's `global`, which links to a global variable.

## Encapsulation by convention and API

Tcl does not make a namespace variable magically private. Other code can still reach it if it knows the name. A good module nevertheless exposes procedures as its supported interface and treats direct variable access as an implementation detail.

## State ownership

Instead of asking “where can I put this variable?”, ask “which component owns this state?”

For bot software, possible owners include configuration, command registry, channel state, persistence, rate limiting, and individual modules.

## Testing

Provide a deliberate reset or constructor-like mechanism for tests rather than letting tests depend on execution order.

## MiniBot connection

M1 used `::minibot::state`. We will now refactor that preview into clearer ownership and APIs instead of having tests modify the variable directly.
