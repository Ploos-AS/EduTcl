# 9 — Encoding, translation and buffering

Text I/O is not merely “characters go in and out.” A channel converts between Tcl strings and external bytes according to configuration.

## Encoding

Inspect or configure a channel encoding with `fconfigure`:

```tcl
fconfigure $channel -encoding utf-8
```

Use the encoding required by the protocol or file format; do not choose one merely because it is familiar.

## Translation

Newline translation can differ across platforms and protocols. `-translation` controls how line endings are interpreted or emitted.

## Buffering

Output may be buffered. Depending on the use case, `-buffering` may be `full`, `line`, or `none`. `flush` requests buffered output to be written.

## Binary data

Binary protocols and files require byte-oriented thinking. Text encodings must not silently transform arbitrary binary bytes. We revisit binary channels when networking becomes practical.

## IRC connection

IRC is a network protocol with defined message framing and encoding considerations. When we reach IRC, we will configure network channels according to the protocol rather than inheriting accidental defaults.

## Lab habit

Whenever an I/O test depends on bytes or line endings, make those assumptions explicit.
