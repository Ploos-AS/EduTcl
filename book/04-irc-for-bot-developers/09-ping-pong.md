# 9 — PING and PONG

Servers use PING/PONG to detect dead or unresponsive connections.

Example:

```text
PING :token
PONG :token
```

A bot should preserve the server's token as protocol data.

## Event-loop implication

A blocked Tcl callback can delay PONG even when the socket itself is healthy. This is why M3's event-loop lessons matter to IRC.

## Keep protocol handling separate

PING handling belongs near the IRC connection layer, not inside a user command such as `!ping`.

A bot command named ping is application behavior; IRC PING is connection maintenance.

## Security and robustness

Do not evaluate or reinterpret the token. Serialize it safely and respond according to protocol semantics.

## Mastery

Trace a PING from parsed dictionary through protocol handler to outbound serializer.
