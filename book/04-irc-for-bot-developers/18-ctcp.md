# 18 — CTCP

CTCP is conventionally carried inside PRIVMSG or NOTICE payloads using delimiter byte 0x01. Examples include ACTION and informational requests such as VERSION.

## Layering

```text
IRC PRIVMSG/NOTICE
   -> message text
   -> optional CTCP decoding
   -> CTCP command + argument
```

CTCP is not a separate IRC command. `ACTION waves` is commonly rendered as an action rather than ordinary chat text.

Do not auto-reply blindly. Apply rate limits and define which requests are supported. Avoid exposing unnecessary system details in VERSION replies. Treat CTCP decoding as another bounded parser with explicit malformed-input behavior.

A later TiCle CTCP module can demonstrate VERSION policy, ACTION observation and rate limiting.

## Mastery

Given a PRIVMSG dictionary, determine whether its text is CTCP without confusing CTCP syntax with Tcl syntax.
