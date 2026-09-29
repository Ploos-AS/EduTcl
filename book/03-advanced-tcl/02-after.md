# 2 — Timers with `after`

## Objectives

Learn to schedule delayed work, pass callback arguments safely, inspect timer identifiers and understand timer ordering.

## Delayed callbacks

```tcl
proc greet {name} {
    puts "Hello, $name"
}

set id [after 250 [list greet Alice]]
```

`after` returns an identifier for the scheduled event.

The callback is a command prefix. This remains safe even when the argument contains spaces or Tcl-looking characters.

## Never construct callback source from input

Prefer:

```tcl
after 1000 [list notify $message]
```

over constructing a string that will later be interpreted as Tcl code.

The distinction becomes critical once `$message` comes from IRC.

## Zero-delay work

```tcl
after 0 [list puts "queued"]
```

This queues work for event processing rather than calling `puts` immediately. It can be useful when code should yield back to the event system before continuing.

## Idle callbacks

Tcl can also schedule work when no other events are ready:

```tcl
after idle [list refresh_cache]
```

Idle work should be small. An idle callback that continually reschedules expensive work can starve useful processing.

## Timer IDs are capabilities

If code retains a timer ID, it can cancel that timer. Treat the ID as lifecycle state, not an incidental string.

## Predict → run → verify → explain

Predict the output order:

```tcl
after 0 {puts B}
puts A
set done 0
after 10 {set done 1}
vwait done
puts C
```

Then run it and explain the result in terms of registration and event servicing.

## Mastery check

You should be able to schedule a callback containing arbitrary data without using `eval`, and explain why the returned timer ID matters.
