# 4 — `vwait` and Event-Driven Programs

`vwait` gives us a small way to observe Tcl's event loop directly.

## Waiting while processing events

```tcl
set done 0
after 100 [list set done 1]
vwait done
puts "finished"
```

`vwait done` waits until variable `done` is written, while Tcl continues processing events.

This is very different from a busy loop.

## Do not busy-wait

Bad:

```tcl
while {!$done} {
    # spin
}
```

That loop keeps Tcl busy and prevents the event system from doing the work that may set `done`.

## Namespace variables

For larger examples, keep lifecycle state owned:

```tcl
namespace eval ::app {
    variable running 1
}

proc ::app::stop {} {
    variable running
    set running 0
}

after 1000 [list ::app::stop]
vwait ::app::running
```

## `vwait` is not the architecture

It is useful for teaching, scripts, tests and small standalone event-driven applications. Later, Eggdrop already has a long-running process and event lifecycle. An Eggdrop script should not start its own competing top-level wait loop.

## Testing asynchronous behavior

A test can arrange a bounded completion event, wait for it, then assert the observed state. Always ensure a test has a timeout/failure path so a broken callback cannot hang the suite forever.

## Mastery check

Explain why `vwait` allows timer callbacks to run while a tight `while` loop may prevent them from running.
