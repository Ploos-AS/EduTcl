# 5 — Blocking and Non-Blocking Channels

A blocking read can stop the event loop while it waits for data. Event-driven bots instead configure long-lived channels for non-blocking operation.

```tcl
fconfigure $chan -blocking 0 -buffering line -encoding utf-8
```

Non-blocking does not mean data is always available. It means an operation should not wait indefinitely for data that has not arrived.

The normal pattern is therefore not "keep calling gets." It is "ask Tcl to notify us when the channel is readable."

## Partial data

Networks deliver streams, not application messages. A readable channel may contain a complete line, part of one, several lines, or EOF. Never assume one readiness event equals one protocol message.

## Configuration is protocol state

Encoding, translation and buffering are part of the protocol contract. Configure them deliberately and in one well-owned place.

## Cleanup

A channel owner must define who closes it, who removes callbacks and what happens to timers associated with it.

## Security

Bound input. A peer that never completes a line can otherwise force a service to retain ever-growing buffered data.

## Mastery

Explain why non-blocking mode and readiness notification belong together.
