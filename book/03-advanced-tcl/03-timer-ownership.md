# 3 — Cancellation and Timer Ownership

Timers create future obligations. Robust software must know who owns those obligations and when they cease to be valid.

## Keep the ID

```tcl
set timer [after 5000 [list expire session-42]]
```

Cancel it when the associated work is no longer valid:

```tcl
after cancel $timer
```

## Ownership

A useful rule is:

> The component that creates a timer should define how that timer is cancelled.

Store timer IDs alongside the state they affect. Do not scatter anonymous timers throughout a large bot.

## Replace, do not accumulate

For a resettable timeout:

```tcl
namespace eval ::watchdog {
    variable timer ""
}

proc ::watchdog::arm {} {
    variable timer
    if {$timer ne ""} {
        after cancel $timer
    }
    set timer [after 5000 [list ::watchdog::expired]]
}

proc ::watchdog::expired {} {
    variable timer
    set timer ""
    puts "timeout"
}
```

This prevents repeated calls to `arm` from silently accumulating timers.

## Stale callbacks

Cancellation is part of state correctness. A callback that fires after its session, socket or user operation has disappeared may mutate the wrong state.

Later we will combine timer ownership with connection state machines.

## Cleanup

A component shutdown path should cancel outstanding timers it owns. Cleanup should be safe to call more than once.

## Security and availability

Unbounded timer creation can become a denial-of-service vector. If each untrusted message creates a timer, an attacker may force the bot to retain large amounts of work and state.

Use explicit limits, replacement semantics or bounded queues where appropriate.

## Mastery check

Given a feature with retries and a timeout, you should be able to identify every timer owner, cancellation path and stale-callback risk.
