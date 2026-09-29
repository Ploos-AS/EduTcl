# M4 MiniIRC Core

MiniIRC is the M4 capstone: a small educational IRC protocol/state core in Tcl.

It is deliberately not a full IRC client or daemon.

## Components

```text
parser.tcl       raw logical line -> dictionary
serializer.tcl   structured fields -> safe logical line
network.tcl      ISUPPORT + casemapping
state.tcl        connection/channel state
outbox.tcl       bounded outbound queue
connection.tcl   lifecycle, PING/PONG, reconnect model
```

## Qualification

Tests use synthetic IRC messages and local Tcl event-loop behavior. No public IRC network is required.

## Future adapters

M5+ will compare this explicit protocol model with Eggdrop's abstractions. Later TiCle chapters will map it to TiCle's actual structured Tcl API.
