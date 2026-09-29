# 25 — M4 Project and Assessment

## Project: MiniIRC Core

Build a standalone Tcl IRC protocol core. It does not need public Internet access.

### Required

- generic line parser;
- safe serializer;
- optional prefix and trailing parameter support;
- selected IRCv3 message tags;
- PING/PONG handling;
- registration lifecycle;
- ISUPPORT storage;
- network-aware casemapping;
- bounded channel/user state;
- bounded outbound queue;
- reconnect/backoff state;
- deterministic tests.

### Security tests

Verify:

- Tcl-looking message text remains data;
- CR/LF outbound injection is rejected;
- malformed lines fail predictably;
- unknown commands remain representable;
- queue limits are enforced;
- stale state is cleared or marked unsynchronized after disconnect;
- timers can be cancelled on shutdown.

### Useful-bot bridge

Feed structured PRIVMSG events into a mock command adapter. Demonstrate how a later Eggdrop or TiCle adapter can provide equivalent application context without coupling commands to raw wire parsing.

### Architecture report

Document ownership of transport, framing, parser, serializer, connection state, network features, outbound scheduling and application commands.

## Qualification

M4 passes only when its automated tests are green and prior milestone regression tests remain green.
