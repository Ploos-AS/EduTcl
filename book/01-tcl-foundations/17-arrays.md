# 17 — Arrays

Tcl arrays are associative collections whose elements are addressed by keys.

```tcl
array set user {
    nick Alice
    role operator
}

puts $user(nick)
puts $user(role)
```

Arrays are variables with array elements; they are not Tcl lists and are not the same data model as dictionaries.

## Dynamic keys

```tcl
set key nick
puts $user($key)
```

## Inspecting arrays

Useful commands include:

```tcl
array exists user
array names user
array size user
array get user
```

`array get` returns key/value data as a list suitable for commands that understand that representation.

## When you will see arrays

Eggdrop scripts, especially older ones, frequently use arrays for configuration, caches, per-channel state, and counters. You must be comfortable reading them even when a newer design might use dictionaries or namespace-owned state.

## Exercise

Create an array of per-channel counters, increment selected entries, list all keys, and distinguish a missing element from an existing one.
