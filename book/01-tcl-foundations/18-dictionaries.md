# 18 — Dictionaries

Dictionaries represent key/value mappings as Tcl values. Unlike arrays, a dictionary can be passed to a procedure, returned from it, nested, and stored as one value.

```tcl
set user [dict create nick Alice role operator]
puts [dict get $user nick]
```

## Updating

```tcl
dict set user role admin
dict set user messages 1
dict incr user messages
```

## Querying safely

Explore `dict exists`, `dict get`, `dict keys`, `dict values`, `dict size`, and `dict for`.

Do not blindly `dict get` a key that may legitimately be absent. Decide what absence means in your API.

## Nested state

```tcl
set state [dict create]
dict set state channels "#tcl" users 12
dict set state channels "#bots" users 4
puts [dict get $state channels "#tcl" users]
```

Nested dictionaries are useful for structured application state, but very deep structures can become awkward. Later we compare dictionaries, arrays, TclOO objects, databases, and module-owned state.

## Arrays versus dictionaries

Do not ask which is universally “better.” Ask whether you need a variable-based associative structure or a first-class value that can cross procedure boundaries.

## TiCle connection

Dictionaries are natural for configuration snapshots, command metadata, structured results, and test fixtures. We will use them extensively before introducing richer abstractions.
