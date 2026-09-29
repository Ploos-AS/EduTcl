# 25 — M3 Project and Assessment

## Project: Event-Driven MiniBot

Build the M3 MiniBot as a standalone Tcl application.

### Required capabilities

- explicit lifecycle state;
- event-driven command processing;
- bounded FIFO queue;
- timer ownership and cancellation;
- command registry using command prefixes;
- at least one scheduled feature;
- clean shutdown;
- structured errors;
- deterministic tests;
- no public network dependency.

### Useful-bot requirement

Implement at least three commands that could plausibly survive into a real bot:

- `about` or `version`;
- `uptime`;
- a bounded timer/reminder feature;
- diagnostics/status;
- another documented useful command.

Toy commands may be used while learning, but the capstone should move toward the TiCle cookbook.

### Adversarial tests

At minimum test:

- Tcl-looking command arguments remain inert;
- queue-full behavior;
- stale/cancelled timer behavior;
- invalid lifecycle transitions;
- shutdown with pending work;
- Unicode data.

### Architecture report

Explain:

1. who owns every timer;
2. who owns the queue;
3. how overload is handled;
4. why command arguments are data;
5. how an IRC adapter could replace the test adapter;
6. how the design could map to TiCle modules later.

## Assessment

A learner passes M3 when they can implement and debug event-driven Tcl rather than merely reproduce examples.

They should be able to reason about callbacks, channels, state machines, queues, coroutines, objects, interpreters, dynamic evaluation and performance boundaries.

## Qualification

The repository milestone passes only after the automated M3 suite is green while M1 and M2 remain green.
