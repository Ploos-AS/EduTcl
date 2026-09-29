# 24 — Refactoring MiniBot into an Event-Driven Core

M3 now combines the milestone's ideas into a new MiniBot architecture.

```text
adapter
   |
   v
bounded event queue
   |
   v
dispatcher / registry
   |
   +--> command modules
   |
   +--> state
   |
   +--> timers
```

## Goals

The M3 core should:

- remain transport-neutral;
- process work through the Tcl event loop;
- own timers explicitly;
- bound queued work;
- preserve command arguments as data;
- expose lifecycle state;
- terminate deterministically in tests.

## Why not IRC yet?

We want the event architecture to be testable without a live network. Later an IRC adapter can feed structured events into the same core.

## From MiniBot to TiCle

The architectural lesson maps naturally to TiCle: transport/runtime can remain separate from Tcl command modules. TiCle already exposes a module lifecycle and command binding model; later course sections will use its actual API rather than inventing one.

## Cookbook seed

M3 command examples should already resemble useful bot behavior: uptime, bounded reminders and diagnostics are better teaching material than dozens of artificial arithmetic commands.

## Security

The core must reject overload rather than grow an unlimited queue, cancel owned timers on shutdown, and never evaluate command arguments as Tcl source.

## Mastery

Explain how the same command module could be driven by stdin in a test, an IRC adapter later, or a TiCle binding without rewriting its core business logic.
