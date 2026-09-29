# 17 — Reusable library design

A reusable library has a deliberate public surface.

## Public API

Document which commands callers may rely on. Everything else can change without becoming an accidental compatibility promise.

## Initialization

Avoid surprising work merely because a file was loaded. Make expensive operations, network access, filesystem mutation, and process-wide configuration explicit.

## Dependencies

Require packages intentionally. Keep dependency direction understandable and avoid circular initialization.

## State

If a library owns mutable state, define lifecycle operations such as initialization, reset, load, save, or destruction as appropriate.

## Errors

Use stable error categories for failures callers may handle. Preserve diagnostic context for unexpected failures.

## Compatibility

Version packages according to the interface you promise, not according to how many commits have happened.

## Eggdrop direction

A library whose core logic has no dependency on Eggdrop can be tested in `tclsh` and adapted into Eggdrop later. This is a central EduTcl design habit.
