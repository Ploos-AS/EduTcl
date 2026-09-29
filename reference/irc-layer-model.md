# IRC Layer Model

Use this checklist when deciding where IRC bot behavior belongs.

| Layer | Owns |
|---|---|
| Transport | socket, bytes, connect/disconnect |
| Framing | complete bounded IRC lines |
| Generic parser | tags, prefix, command, params |
| Protocol semantics | PING, numerics, CAP, command meanings |
| Network model | ISUPPORT, casemapping, capabilities |
| Connection state | registration, nick, reconnect |
| Channel/user state | membership, modes, topic |
| Outbox | safe serialization, queue, rate policy |
| Bot adapter | message context and command routing |
| Module | useful application behavior |

A module should not need to parse raw IRC lines or write directly to a socket.
