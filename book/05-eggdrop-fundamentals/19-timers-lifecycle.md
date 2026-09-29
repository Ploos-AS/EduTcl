# 19 — Timers and Lifecycle

Timers create work that outlives the callback that scheduled it.

A module therefore needs ownership: which timers belong to it, how they are cancelled, and what happens during reload or shutdown.

## Rule

Initialization may create resources. Shutdown must release the resources the module owns.

Avoid duplicate timers after reload.

## Testing

Time-dependent logic should be split from scheduling. Test the decision as ordinary Tcl; test timer ownership separately.
