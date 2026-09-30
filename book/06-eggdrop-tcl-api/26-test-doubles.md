# 26 — Test Doubles for Eggdrop APIs

A test double should model only the contract the module needs.

Do not build a second Eggdrop.

Useful doubles make ownership and failure visible: output queues, capabilities, binds, timers, asynchronous requests, channel snapshots and authorization facts.

Keep integration assumptions in separate tests against a real Eggdrop runtime.
