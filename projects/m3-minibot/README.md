# M3 MiniBot — Event-Driven Core

This project evolves MiniBot into a transport-neutral event-driven bot core.

## Planned structure

```text
lib/
  core.tcl
  queue.tcl
  registry.tcl
  timers.tcl
  commands.tcl
main.tcl
```

The implementation will be qualified without public network access.

## Useful commands

The reference implementation will favor commands with real bot value:

- `about`
- `uptime`
- `status`
- bounded reminders

This project is also the first seed for the later TiCle cookbook. Concepts will be mapped to TiCle's real module API in the TiCle milestones rather than copying this standalone runtime into TiCle.

## Rules

- no `eval` of user command text;
- bounded queues;
- explicit timer ownership;
- deterministic shutdown;
- structured errors;
- tests for hostile-looking input.
