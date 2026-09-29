# 12 — QUIT and NICK Changes

QUIT removes a user from the connection's observed channel state.

NICK changes the identifier under which a user is known.

Examples:

```text
:alice!u@host QUIT :leaving
:alice!u@host NICK :alice_
```

## Nicknames are mutable

Do not use a nickname as a permanent database identity unless the application explicitly accepts that limitation.

A nick change may require updating membership indexes, recent-speaker state, rate-limit keys and other ephemeral structures.

## Bot nick changes

The bot's own nickname can change too, including during collision recovery. Reply routing and self-event detection must use current state.

## Cleanup

QUIT should remove ephemeral membership data associated with that connection view. Persistent features such as `seen` may deliberately record a final event before cleanup.

## Cookbook connection

A future `seen` module is a useful example because it forces us to distinguish mutable nicknames, observed events, persistence and privacy policy.

## Mastery

List the in-memory structures that a NICK event may need to update in a non-trivial bot.
