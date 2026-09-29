# 19 — IRCv3 Message Tags

IRCv3 can place message tags before the traditional prefix/command fields.

Conceptually:

```text
@key=value;flag :nick!u@h PRIVMSG #tcl :hello
```

Tags are metadata, not bot commands.

## Parser evolution

A parser designed in layers can add an optional tags phase before prefix parsing without rewriting PRIVMSG handling.

Preserve unknown tags. Extensions should not require the generic parser to know every key.

Tag escaping has protocol-specific rules; do not substitute Tcl escaping rules.

## Trust

Tags are remote data. A tag that claims account, time or other metadata has meaning only according to the negotiated protocol/network semantics.

## Mastery

Explain how to extend the M4 parser with tags while keeping old tag-free messages valid.
