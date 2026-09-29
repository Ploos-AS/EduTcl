# 8 — Channels beyond basic files

A Tcl channel is an I/O abstraction. Files, standard streams, sockets, and some subprocess interfaces can all be represented as channels.

## Standard channels

Tcl normally exposes `stdin`, `stdout`, and `stderr`.

```tcl
puts stdout "normal output"
puts stderr "diagnostic output"
```

## Inspecting channels

```tcl
chan names
```

Depending on Tcl version and environment, channel commands and capabilities vary. Inspect the runtime rather than assuming every deployment is identical.

## Configuration

`fconfigure` can inspect and change channel properties. Modern Tcl also exposes related `chan` operations.

Important properties include encoding, translation, buffering, and blocking behavior.

## Ownership

For every opened channel, define who closes it. Leaking channels in a long-running bot can become an operational failure rather than a minor scripting mistake.

## Event-driven future

Later, sockets and readable/writable events will connect channels to Tcl's event loop. File I/O is therefore foundational knowledge for networked bot programming.
