# 14 — Generators and Cooperative Workflows

A coroutine can model a producer that yields one value at a time.

```tcl
proc numbers {limit} {
    for {set i 0} {$i < $limit} {incr i} {
        yield $i
    }
}

coroutine nextNumber numbers 3
```

This is useful when incremental processing is clearer than constructing an entire result at once.

## Event-driven workflows

Coroutines can also make multi-step asynchronous logic read sequentially, but an event still has to resume the coroutine. A timer or `fileevent` callback can do that.

The architecture therefore remains event-driven; the coroutine is a way to organize continuation state.

## Cancellation

A workflow needs an explicit cancellation policy. If a connection disappears, any coroutine representing work for that connection must not continue against stale state.

## Choose clarity

Do not convert every callback into a coroutine. Simple event handlers are often clearer as ordinary procedures.

Use coroutines when they make a multi-stage cooperative workflow easier to understand and test.

## Mastery

Describe where the state of a suspended coroutine lives and what must happen when the resource it represents is cancelled.
