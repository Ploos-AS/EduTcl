# 3 — Prefixes and Sources

A prefix identifies the apparent source of a message.

Common user-shaped prefixes look like:

```text
nick!user@host
```

Server prefixes can have different forms.

Do not require every prefix to contain nick, user and host. Parse the generic prefix first; derive optional user-source fields only when its shape supports them.

## Trust

A parsed nickname is identity data from the IRC connection, not authorization by itself.

Privileges must come from the bot's policy and the server/network state it trusts, not from string appearance alone.

## Structured representation

A useful educational parser can preserve:

```tcl
prefix nick!user@host
nick   nick
user   user
host   host
```

while allowing absent derived fields.

## Mastery

Explain why prefix parsing and authorization are separate operations.
