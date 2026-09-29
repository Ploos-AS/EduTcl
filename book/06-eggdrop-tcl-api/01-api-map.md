# 1 — API Map

Think of Eggdrop's Tcl commands as services owned by the host.

Useful groups include:

- bot/server state;
- channels and members;
- user database and flags;
- binds and callbacks;
- timers;
- outbound IRC;
- logging;
- DCC/console;
- botnet;
- filesystem/network helpers.

A module should depend on the smallest useful slice.

## Architecture

```text
callback adapter
  -> application/service logic
     -> small Eggdrop API adapter
```

This is easier to test than allowing every procedure to call global host commands directly.
