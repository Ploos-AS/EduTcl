# 9 — Timers

A timer is a resource.

Store enough information to cancel timers your module owns. Avoid reloads that silently duplicate scheduled work.

The callback should be small: scheduling policy and application logic are easier to test as separate procedures.

Never let untrusted users create an unbounded number of timers.
