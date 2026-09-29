# 2 — IRC Message Grammar

A traditional IRC message can be understood as:

```text
[:prefix SPACE] command [params] CRLF
```

Later IRCv3 message tags add an optional field before the prefix.

Example:

```text
:nick!user@example PRIVMSG #tcl :hello world
```

Conceptually:

- prefix: `nick!user@example`
- command: `PRIVMSG`
- middle parameter: `#tcl`
- trailing parameter: `hello world`

The colon introducing the trailing parameter is syntax; it is not part of the logical parameter value.

## Parse structure, not guesses

Do not parse IRC with a sequence of assumptions such as "the third word is always the channel." Different commands have different parameter meanings.

First parse the generic message grammar. Interpret command-specific semantics afterward.

## Mastery

Separate generic syntax from command-specific meaning for a PRIVMSG line.
