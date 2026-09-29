# 8 — Registration: NICK and USER

A traditional IRC client begins registration by introducing a nickname and user identity.

Conceptually:

```text
NICK EduBot
USER edubot 0 * :EduTcl teaching bot
```

Exact network requirements vary, and modern networks may add capability negotiation, authentication or TLS before registration is complete.

## Registration is a state machine

Do not model connection as a boolean.

Useful states include:

```text
disconnected
connecting
registering
online
closing
```

Server replies determine when registration actually succeeded.

## Nickname collision

A requested nickname may be unavailable. Later lessons handle collision policy and recovery rather than assuming NICK always succeeds.

## Secrets

Authentication credentials must not be hard-coded into examples, logs or repository history.

## Mastery

Explain the difference between TCP-connected and IRC-online.
