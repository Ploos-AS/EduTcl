# 15 — Functional-style list transformations

Tcl can transform list values without manually managing an output index.

## lmap

```tcl
set normalized [lmap name $names {
    string tolower [string trim $name]
}]
```

`lmap` resembles `foreach`, but collects each body result into a new list.

## Filtering

A clear loop is often preferable to a clever expression:

```tcl
set enabled {}
foreach item $items {
    if {[dict get $item enabled]} {
        lappend enabled $item
    }
}
```

The goal is not to imitate another programming language. Use Tcl constructs that make data flow obvious.

## Side effects

Transformations are easiest to reason about when the body computes a value rather than secretly changing unrelated global state.

## Exercise

Normalize a list of command names, reject empty names, preserve Unicode, and return a new list without modifying the input value.
