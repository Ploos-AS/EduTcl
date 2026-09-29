# M3 Lab — Non-Blocking I/O and Sockets

Build a loopback line service entirely in Tcl.

## Requirements

Create a local server bound to `127.0.0.1` and an event-driven client. The client must use non-blocking I/O and `fileevent`.

The exercise must demonstrate:

- channel configuration;
- readable callbacks;
- complete-line delivery;
- EOF handling;
- explicit channel ownership;
- a watchdog timeout;
- timer cancellation after success;
- deterministic shutdown.

## Adversarial data

Send this as ordinary line data:

```text
$name [error BOOM] ; puts BAD
```

It must arrive unchanged and must never execute.

## Failure exercise

Modify the server to close before sending a response. Record the resulting lifecycle transition. Then make the server delay long enough for the watchdog to fire.

## Design exercise

Separate the solution into:

```text
transport -> line framing -> message handler
```

Explain which layer will later become IRC parsing and which layers can remain generic.

## Rules

Do not use public Internet services. Do not busy-wait. Do not use `eval` to invoke message handlers. Every timer and channel must have an owner and cleanup path.

## Exit criteria

You can explain every event that keeps the program alive and prove the program terminates on success, EOF and timeout.
