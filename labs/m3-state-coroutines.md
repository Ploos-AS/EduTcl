# M3 Lab — State, Backpressure and Coroutines

## Part A — Connection state machine

Implement:

```text
idle -> connecting -> connected -> closing -> closed
                  \-> failed
failed -> connecting
```

Reject every transition not shown.

Write tests for legal and illegal transitions.

## Part B — Bounded outbound queue

Implement a queue with:

- configurable maximum length;
- FIFO behavior;
- structured `QUEUE FULL` error;
- no execution of queued values;
- deterministic tests.

Queue this value and prove it remains data:

```text
$name [error BOOM] ; puts BAD
```

## Part C — Fair work

Create two producers and demonstrate a scheduling policy that prevents one producer from consuming the entire bounded capacity without explanation.

Document the policy rather than claiming there is one universally correct algorithm.

## Part D — Coroutine

Create a coroutine representing a three-stage workflow. Resume it with explicit values and record each stage.

Then cancel the resource it represents and ensure the workflow cannot mutate stale application state.

## Part E — Trace

Add a temporary variable trace for diagnostic observation. Remove it during cleanup.

Then explain why the connection state machine should still use an explicit `transition` API rather than relying on a write trace.

## Exit criteria

You pass when overload, cancellation and invalid lifecycle transitions are observable and bounded rather than implicit.
