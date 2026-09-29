# 1 — Eggdrop Architecture

Eggdrop is a long-running IRC bot with an embedded Tcl interpreter.

A Tcl script normally does not own the IRC socket. Eggdrop handles connection and protocol machinery and exposes bot-oriented commands and events to Tcl.

Compare the layers:

```text
M4 MiniIRC:
socket -> framing -> parser -> state -> command adapter -> module

Eggdrop:
Eggdrop core -----------------------------> Tcl script
              binds / bot APIs / state
```

The lower layers still exist; Eggdrop owns them.

## Why M4 mattered

Knowing IRC lets you understand what a bind means, why reconnects affect state, why nicknames are not durable identity, and why output still needs flood control.

## Boundary

Do not implement your own raw socket protocol inside an ordinary Eggdrop module unless the module genuinely needs another network protocol.
