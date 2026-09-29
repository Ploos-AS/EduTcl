# 14 — WHO, WHOIS and NAMES

IRC provides queries that help clients learn about users and channel membership. Their responses often arrive as sequences of numeric replies followed by an end numeric.

## Multi-message transactions

```text
request
  -> zero or more data replies
  -> terminating reply
```

The event loop must continue processing unrelated IRC traffic while a query is in progress.

NAMES can help initialize membership state, but live JOIN/PART/NICK/QUIT events may occur around the same time. State synchronization requires a deliberate strategy.

WHOIS and related information can contain host/account/server metadata. A bot feature exposing that data should have a documented purpose and privacy policy.

## Mastery

Design a non-blocking WHOIS collector without stopping PING/PONG or normal PRIVMSG handling.
