# 23 — Reconnect and State Recovery

Network connections fail. A production bot treats reconnect as ordinary lifecycle behavior.

## Backoff

Immediate infinite reconnect loops can hammer a server and consume resources. Use bounded/exponential-style backoff with sensible caps and reset policy.

## Rebuild state

After reconnect:

- negotiate/register again;
- establish the current nickname;
- rejoin configured channels according to policy;
- rebuild membership/state from authoritative events;
- restart only connection-owned operations that remain relevant.

Do not blindly reuse stale channel state.

## Timer ownership

Reconnect timers belong to the connection lifecycle and must be cancellable during shutdown.

## External integrations

IRC recovery should not depend on optional PBMP/BotAI/BotWeb services. This mirrors TiCle's intended separation.

## Mastery

Draw the lifecycle from disconnect through backoff, reconnect, registration and state resynchronization.
