# 9 — Asynchronous Connections

A synchronous connection attempt may block. Tcl can initiate an asynchronous TCP connection:

```tcl
set chan [socket -async $host $port]
```

Completion is observed through channel events. A writable event indicates that connection setup has progressed, but success must still be checked through channel error state.

A robust connector therefore owns:

- the channel;
- a connection timeout;
- completion callback;
- failure callback;
- cleanup that cancels the timeout and removes events.

## State, not guesses

Model connection lifecycle explicitly, for example:

```text
connecting -> connected -> closing -> closed
           \-> failed
```

Callbacks should validate that they still belong to the expected state.

## DNS caveat

Asynchronous socket behavior does not magically make every name-resolution implementation or platform behavior identical. Deterministic tests should use loopback numeric addresses.

## Mastery

Explain why "writable" during async connection is a signal to check completion, not proof of successful connection.
