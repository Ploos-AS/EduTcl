# 16 — TclOO Fundamentals

TclOO is Tcl's built-in object system. It is useful when state and behavior naturally belong to individual instances.

```tcl
oo::class create Counter {
    variable value

    constructor {} {
        set value 0
    }

    method increment {} {
        incr value
    }

    method value {} {
        return $value
    }
}

set c [Counter new]
$c increment
puts [$c value]
$c destroy
```

An object command is still a Tcl command. Method invocation therefore fits Tcl's command model rather than introducing a separate syntax.

## When objects help

Objects are useful for multiple connections, sessions or components that share behavior but own separate state.

Do not introduce a class merely because a namespace would look less sophisticated. Choose the simplest ownership model that makes lifecycle clear.

## Encapsulation is not a security boundary

TclOO organizes APIs and state. It does not make untrusted code safe.

## Mastery

Explain when two connection instances justify objects and when one namespace-owned singleton may be simpler.
