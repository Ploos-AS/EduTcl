# 4 — Commands and Numeric Replies

IRC messages use textual commands such as:

```text
PRIVMSG
NOTICE
JOIN
PART
NICK
PING
```

Servers also use three-digit numeric replies.

Examples include welcome, errors and query results.

## Normalize carefully

For dispatch, textual commands are commonly treated case-insensitively and can be normalized to uppercase.

Numeric replies should remain recognizable as numeric command tokens rather than being given invented names too early.

## Separate syntax and interpretation

The generic parser should return a command token. A later layer decides whether that token maps to PRIVMSG handling, a registration numeric or an unknown extension.

Unknown commands should remain representable. Extensible protocols should not require the parser to know every future command.

## Mastery

Explain why an unknown command can still be syntactically valid IRC.
