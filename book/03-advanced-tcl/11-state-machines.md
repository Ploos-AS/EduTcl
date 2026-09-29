# 11 — State Machines

Asynchronous programs become easier to reason about when lifecycle is represented explicitly.

Instead of several loosely related booleans, define states such as:

```text
idle -> connecting -> connected -> closing -> closed
                  \-> failed
```

## Validate transitions

A state transition should be deliberate:

```tcl
proc transition {from to} {
    set allowed [dict create         idle       {connecting closed}         connecting {connected failed closing}         connected  {closing failed}         closing    {closed}         failed     {closed connecting}         closed     {}]

    if {$to ni [dict get $allowed $from]} {
        error "invalid transition: $from -> $to"
    }
    return $to
}
```

## Why this helps

Callbacks can arrive after cancellation, EOF can race with shutdown, and timeouts can fire near successful completion. A state machine gives each callback a way to ask whether its action is still valid.

## Events versus states

"timeout" is normally an event. "failed" is a state. Keeping those concepts distinct produces clearer designs.

## Security and correctness

Unexpected transitions should fail closed rather than silently mutate unrelated state. Log enough context to diagnose them without leaking secrets.

## Mastery

Draw the states and legal transitions of a reconnecting bot connection and identify how stale callbacks are rejected.
