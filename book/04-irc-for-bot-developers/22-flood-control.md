# 22 — Flood Control and Outbound Queues

A bot cannot safely write unlimited outbound traffic as fast as modules generate it.

Use a bounded outbound queue and an explicit scheduling/rate policy.

## Backpressure

When the queue is full, the system must have a defined response: reject, coalesce, drop a documented low-priority class, or disconnect/recover where appropriate.

Unlimited growth is not a policy.

## Priorities

Connection-critical traffic such as PONG may need different treatment from low-priority informational output. Avoid a design where a flood of cookbook responses prevents protocol maintenance.

## Module API

Modules should request messages through an outbound API rather than writing directly to the socket. This centralizes serialization, bounds and rate policy.

## Mastery

Explain how a popular `!weather` command could otherwise make the bot disconnect itself.
