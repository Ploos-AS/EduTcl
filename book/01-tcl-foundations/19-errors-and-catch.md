# 19 — Errors and catch

Errors are part of a program's control and diagnostic model. Do not hide them blindly.

## Producing an error

```tcl
proc require_nick {nick} {
    if {$nick eq ""} {
        error "nickname must not be empty"
    }
    return $nick
}
```

## Catching an error

```tcl
if {[catch {require_nick ""} result]} {
    puts "Error: $result"
}
```

`catch` reports a completion code and captures the result. Tcl has richer error information than just a message; later chapters cover options, stack traces, custom error codes, and `try`.

## Do not swallow failures

This is poor operational behavior:

```tcl
catch {some_operation}
```

with no inspection, logging, or intentional reason. A bot that silently ignores every failure becomes extremely difficult to diagnose.

## User error versus system error

An invalid bot command argument is not necessarily the same class of problem as a failed file write, network timeout, programmer bug, or corrupted configuration.

Our later architecture will classify failures and decide what may be shown to an IRC user versus what belongs in logs.

## Exercise

Write a procedure that validates a simple numeric limit. Make invalid input fail clearly, catch that failure at the caller, and produce a user-friendly result without discarding the diagnostic information.
