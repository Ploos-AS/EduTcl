# 20 — Files and basic I/O

Bots need configuration, persistent state, logs, fixtures, and test data. Tcl exposes I/O through channels.

## Write a file

```tcl
set f [open "example.txt" w]
puts $f "Hello"
close $f
```

## Read a file

```tcl
set f [open "example.txt" r]
set data [read $f]
close $f
puts $data
```

Always reason about who owns an open channel and when it is closed. Later we introduce patterns that make cleanup reliable even when errors occur.

## Line-oriented input

`gets` reads a line from a channel. Standard input, files, sockets, and subprocess pipes participate in Tcl's channel model, which is why learning file I/O prepares you for later networking.

## Paths are data

Never construct sensitive paths from untrusted IRC text without a clear policy. Later security chapters cover canonicalization, traversal, permissions, temporary files, and safe storage.

## Encodings

Text crosses encoding boundaries when read or written. Tcl channels can be configured for encoding and translation. We defer detailed channel configuration until the intermediate course, then revisit it for IRC.

## Exercise

Write a small configuration-like data file, read it back, and ensure the channel is closed. Then deliberately request a missing file and inspect the error rather than suppressing it.
