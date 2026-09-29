# 11 — Channels, JOIN and PART

JOIN and PART change channel membership state.

Examples:

```text
JOIN #tcl
:alice!u@host JOIN #tcl
:alice!u@host PART #tcl :going home
```

A bot can both send JOIN and receive JOIN events.

## State ownership

The connection/state layer should maintain channel membership. Command modules should query structured state rather than reconstructing it from old raw lines.

## Self versus others

When the bot itself joins or parts, its state transition differs from another user's membership event. The bot therefore needs a reliable notion of its current nickname.

## PART reason

The reason is optional application data. Do not require it for the event to be valid.

## Reconnect

After reconnect, old channel state cannot simply be assumed correct. Registration and rejoin policy must rebuild authoritative state.

## Mastery

Describe how self-JOIN, another user's JOIN and reconnect affect state differently.
