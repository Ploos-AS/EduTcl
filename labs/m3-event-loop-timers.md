# M3 Lab — Event Loop and Timers

## Goal

Build a small timer-owned component without Eggdrop.

## Part A — Predict

Before running code, predict the order of callbacks scheduled with delays of 0, 10 and 20 ms. Explain why registration order and execution time are different concepts.

## Part B — Safe arguments

Create a callback whose argument is:

```text
$name [error BOOM] ; puts BAD
```

Pass it with `list`. Verify that the text remains data.

## Part C — Resettable timeout

Create namespace `::timeout` with:

- `arm milliseconds callback`
- `cancel`
- at most one active timer;
- a timer ID stored as namespace state.

Calling `arm` twice must cancel the previous timer.

## Part D — Lifecycle

Create a standalone demo using `vwait` that:

1. records `start`;
2. schedules two events;
3. cancels one;
4. exits through a bounded completion timer;
5. prints the event history.

## Part E — Failure analysis

Explain what happens when:

- a timer callback throws an error;
- a component forgets to cancel a stale timer;
- untrusted users can create unlimited timers;
- a callback blocks for several seconds.

## Exit criteria

You pass the lab when you can explain every scheduled callback, its owner, its cancellation path and why arbitrary callback arguments remain data.
