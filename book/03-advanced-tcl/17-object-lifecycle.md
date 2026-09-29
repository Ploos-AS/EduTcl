# 17 — Objects, Classes and Lifecycle

Objects become valuable in asynchronous software when lifecycle ownership is explicit.

A connection object might own:

- its channel;
- state machine state;
- timeout IDs;
- outbound queue;
- callbacks;
- configuration.

## Constructor

The constructor establishes invariants. Avoid publishing a half-initialized object to asynchronous callbacks.

## Destructor

A destructor can release resources, but cleanup design should not rely on surprising destruction timing. Explicit shutdown is often useful for asynchronous resources.

Cleanup should tolerate partially initialized or already-closed resources.

## Object command lifetime

After an object is destroyed, its command no longer exists. A previously scheduled callback containing that object command can therefore become stale.

Cancel owned callbacks/timers before destruction, or route them through a lifecycle mechanism that can reject stale work.

## Identity

Object identity can help associate callbacks with the resource that created them. It does not remove race/lifecycle reasoning.

## Mastery

List every external resource an object owns and show how each is released before or during destruction.
