# M4 — IRC for Bot Developers

M4 teaches IRC from the wire upward so bot developers understand what Eggdrop and TiCle are abstracting.

The goal is not to implement a complete IRC daemon. The goal is to read, parse, reason about and safely generate IRC protocol messages.

## Chapters

1. IRC as a line protocol
2. Message grammar
3. Prefixes and sources
4. Commands and numeric replies
5. Parameters and trailing parameters
6. Building a parser
7. Serializing IRC messages
8. Registration: NICK and USER
9. PING and PONG
10. PRIVMSG and NOTICE
11. Channels, JOIN and PART
12. QUIT and NICK changes
13. KICK, TOPIC and MODE
14. WHO, WHOIS and names
15. Numeric replies
16. ISUPPORT / 005
17. IRC casemapping
18. CTCP
19. Message tags and IRCv3 foundations
20. Capability negotiation foundations
21. Tracking channel/user state
22. Flood control and outbound queues
23. Reconnect and state recovery
24. Parser fuzzing and adversarial input
25. M4 project and assessment

## Architecture thread

```text
bytes
  -> line framing
  -> IRC parser
  -> structured message dictionary
  -> state/events
  -> bot command logic
```

Each layer has a different responsibility.

## TiCle connection

TiCle already has a C IRC transport/parser and exposes structured callbacks to Tcl. M4 builds an independent educational parser so the learner can understand and test the protocol model before later comparing it with TiCle's real API.

## Security thread

IRC input is untrusted network data. M4 repeatedly covers line bounds, malformed input, injection through outbound serialization, data/code separation, state desynchronization and resource limits.

## Exit criteria

The learner can inspect raw IRC traffic, parse it into structured data, serialize safe messages, understand important commands/numerics and maintain bounded connection/channel state.
