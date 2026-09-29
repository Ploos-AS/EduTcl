# 15 — Arguments and results

Procedure parameters describe the interface between a caller and a procedure.

## Required arguments

```tcl
proc greet {nick} {
    return "Hello, $nick"
}
```

## Default arguments

```tcl
proc greet {nick {greeting Hello}} {
    return "$greeting, $nick"
}
```

## Variable numbers of arguments

A final parameter named `args` collects remaining arguments as a Tcl list:

```tcl
proc show {args} {
    foreach item $args {
        puts $item
    }
}
```

We will later discuss when variadic interfaces are appropriate and when an explicit API is clearer.

## return

`return` supplies a procedure result:

```tcl
proc normalize_command {name} {
    return [string tolower [string trim $name]]
}
```

A procedure also has a result when execution reaches the end, but explicit `return` is often clearer when communicating intent to beginners.

## Design exercise

Write `is_command` that receives message text and a prefix and returns a boolean indicating whether the text starts with that prefix. Do not read global state.

## Future callback design

Later, an Eggdrop callback may receive values such as nick, userhost, handle, channel, and text. Treating those as explicit inputs rather than hidden global dependencies makes the useful logic testable outside Eggdrop.
