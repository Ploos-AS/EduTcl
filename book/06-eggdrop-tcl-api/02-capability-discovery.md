# 2 — Discovering Capabilities

Embedded Tcl runs inside a host whose available commands may depend on Eggdrop version, loaded modules and configuration.

Do not assume every optional facility exists merely because Tcl itself is running.

At a compatibility boundary, explicit capability checks can produce a clear startup error instead of a mysterious failure during an IRC event.

Keep capability detection centralized so business logic does not become a forest of version checks.
