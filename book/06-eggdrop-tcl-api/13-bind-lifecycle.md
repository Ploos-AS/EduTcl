# 13 — Bind Inspection and Lifecycle

Callbacks are resources owned by a module.

A reload-safe module should know what it registered and undo what it owns during shutdown. Do not remove another module's callback merely because it has a similar mask.

Centralize registration. This makes duplicate binds and incomplete teardown visible and testable.
