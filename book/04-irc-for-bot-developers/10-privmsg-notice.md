# 10 — PRIVMSG and NOTICE

PRIVMSG carries ordinary IRC messages. NOTICE is similar at the wire level but has different behavioral expectations.

Typical channel message:

```text
:alice!u@host PRIVMSG #tcl :!hello world
```

Typical direct message:

```text
:alice!u@host PRIVMSG EduBot :hello
```

## Separate IRC parsing from bot command parsing

The IRC parser returns:

```tcl
command PRIVMSG
params  {#tcl {!hello world}}
```

Only a later bot layer decides whether the text begins with a configured command prefix.

## Reply target

A channel message is usually answered to the channel; a direct message is normally answered to the sender. Treat this as explicit routing logic rather than scattering assumptions through command modules.

## NOTICE

Bots should be conservative about automatically replying to NOTICE messages; careless automatic replies can create loops.

## Untrusted text

Message text, target and source fields are network data. Keep them as values.

## Mastery

Given a structured PRIVMSG, derive a reply context without evaluating the message text.
