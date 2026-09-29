# 6 — `fileevent`

`fileevent` associates a callback with channel readiness.

```tcl
fileevent $chan readable [list ::client::readable $chan]
```

When Tcl observes the channel as readable, it invokes the callback through the event loop.

Remove a handler with:

```tcl
fileevent $chan readable {}
```

## Read until no complete work remains

A readable callback should do bounded useful work and return control. It must distinguish ordinary input, temporary lack of a complete record and EOF.

```tcl
proc readable {chan} {
    if {[gets $chan line] >= 0} {
        handle $line
    } elseif {[eof $chan]} {
        fileevent $chan readable {}
        close $chan
    }
}
```

Real code also needs error handling and lifecycle ownership.

## Callback lifetime

A callback can become stale if the channel closes or the logical connection is replaced. Connection state must therefore identify which callbacks still belong to it.

## Eggdrop connection

Later Eggdrop hides some channel mechanics behind its own APIs, but the callback discipline remains the same: do bounded work and return.

## Mastery

Describe readiness, EOF and callback removal as three distinct concepts.
