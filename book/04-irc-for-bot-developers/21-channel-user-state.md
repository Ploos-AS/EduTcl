# 21 — Tracking Channel and User State

A useful bot often needs a local model of channels and observed users.

State may include current nick, joined channels, membership, status modes, topics and selected network properties.

## Derived cache, not eternal truth

IRC state is reconstructed from server messages. Disconnects, reconnects and incomplete synchronization can make a cache stale.

Make synchronization status explicit.

## Identity

Keep display nick separate from its casemapped dictionary key. Do not automatically equate a nick with a persistent authenticated identity.

## Bounds and privacy

Do not retain every observed fact forever. Define what is needed, how long it is retained and why.

This becomes important for cookbook modules such as seen, statistics and moderation logs.

## Mastery

Classify each proposed bot datum as connection state, ephemeral cache or deliberately persistent application data.
