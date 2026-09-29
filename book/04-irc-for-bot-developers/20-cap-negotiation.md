# 20 — Capability Negotiation Foundations

Modern IRC clients can negotiate optional capabilities through CAP.

The important lesson is architectural: capabilities are discovered and negotiated during connection setup, and enabled behavior belongs to connection state.

## State machine

Registration can now contain additional phases:

```text
connecting
 -> negotiating
 -> registering
 -> online
```

Do not scatter checks for capabilities throughout unrelated modules. Provide a connection API such as "is capability X enabled?"

## Failure policy

A bot should distinguish required capabilities from optional enhancements. Failure to obtain an optional capability should not necessarily prevent normal IRC operation.

## TiCle connection

TiCle's roadmap includes IRCv3. EduTcl therefore teaches a capability-oriented architecture before relying on any particular future TiCle implementation.

## Mastery

Design a negotiation state that can continue when an optional capability is unavailable.
