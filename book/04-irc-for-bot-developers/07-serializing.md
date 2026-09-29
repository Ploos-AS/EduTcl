# 7 — Serializing IRC Messages

Parsing turns wire text into structured data. Serialization performs the reverse operation.

Do not build outbound IRC by casually concatenating untrusted strings.

## Contract

A serializer should:

- validate the command token;
- reject CR and LF in every field;
- distinguish middle and trailing parameters;
- produce one logical IRC line;
- leave CRLF framing to the transport layer.

Example logical message:

```text
PRIVMSG #tcl :hello world
```

## Why CR/LF matters

If a nickname, channel, message or other external value can inject a newline, one intended command can become multiple wire commands.

## Structured API

Prefer:

```tcl
::irc::serialize PRIVMSG [list #tcl] "hello world"
```

over:

```tcl
set line "PRIVMSG $target :$text"
```

The first form gives one component responsibility for wire safety.

## Mastery

Explain why escaping Tcl metacharacters is not the same problem as preventing IRC line injection.
