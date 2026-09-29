# 1 — IRC as a Line Protocol

IRC is fundamentally a stream protocol carrying messages separated into lines.

A bot must not assume one TCP read equals one IRC message. TCP can deliver partial lines, several lines together, or EOF between events.

The transport layer therefore frames the byte stream into complete IRC lines before the IRC parser sees them.

## CRLF

IRC protocol lines are conventionally terminated on the wire with CRLF. Keep wire framing separate from the logical message passed to the parser.

## Bounds

Never buffer an unlimited unfinished line. Protocol-facing software needs an explicit maximum and failure policy.

## Layering

```text
TCP bytes -> line framer -> IRC parser
```

The parser should not need to know how many socket reads produced the line.

## Mastery

Explain why `fileevent readable` does not imply that one complete IRC message is available.
