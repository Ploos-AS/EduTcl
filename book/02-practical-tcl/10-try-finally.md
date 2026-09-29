# 10 — Reliable cleanup with try/finally

Resources must be released even when an operation fails.

```tcl
set f [open $path r]
try {
    set data [read $f]
} finally {
    close $f
}
```

The `finally` script runs as control leaves the `try`, including error paths.

## Why this matters for bots

Long-running processes amplify leaks. A forgotten channel, temporary file, lock, or other resource may accumulate until a bot fails hours or weeks later.

## Cleanup must not be an afterthought

Acquire a resource, establish its ownership immediately, and make its release visible in the same logical unit.

## Errors in cleanup

Cleanup can itself fail. Later operational chapters discuss how to preserve useful diagnostics when both the main operation and cleanup encounter problems.

## Exercise

Write a procedure that opens a file, processes it, and deliberately throws an error halfway through. Demonstrate that the channel is still closed.
