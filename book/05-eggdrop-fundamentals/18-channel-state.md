# 18 — Channel State

Bots often need current channel membership and per-channel configuration.

Treat observed membership as runtime state, not permanent truth. Joins, parts, quits, kicks, nick changes, reconnects and netsplits can invalidate assumptions.

## Ownership

Decide which layer owns each fact:

- Eggdrop-owned live channel state;
- module-owned ephemeral state;
- module-owned persistent state.

Do not duplicate Eggdrop state without a reason.

## MiniEgg

The teaching mock keeps a bounded channel/member model so exercises can verify lifecycle behavior. It remains intentionally smaller than real Eggdrop.
