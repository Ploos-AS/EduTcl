# 16 — Scope and globals

Scope answers a fundamental question: which variable does a name refer to here?

## Procedure scope

```tcl
set name global

proc demo {} {
    set name local
    return $name
}

puts [demo]
puts $name
```

The two variables are distinct.

## global

Tcl can explicitly link a procedure variable to a global variable:

```tcl
set counter 0

proc increment {} {
    global counter
    incr counter
}
```

This is valid Tcl, but widespread mutable global state makes larger bots difficult to test and reason about.

## Pass data when practical

Prefer explicit interfaces:

```tcl
proc increment {counter} {
    return [expr {$counter + 1}]
}

set counter [increment $counter]
```

Not every stateful application can avoid shared state, but the ownership of state should be deliberate.

## Preview: namespaces and upvar

Later we will learn namespace variables and Tcl's `upvar` mechanism. They solve different problems and should not be treated as magic replacements for understanding scope.

## Eggdrop connection

Legacy Eggdrop scripts often rely heavily on globals. EduTcl teaches you to read that style, but new TiCle-oriented code should expose dependencies and state ownership clearly.

## Debugging drill

Create global and local variables with the same name. Predict every value before running the program, then modify the procedure to access the global explicitly and explain what changed.
