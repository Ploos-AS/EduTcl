# 13 — Coroutines

Callbacks are natural for events, but a long asynchronous workflow can become difficult to read when every step is another callback.

Tcl coroutines let a procedure suspend and later resume.

```tcl
proc sequence {} {
    puts first
    yield
    puts second
}

coroutine demo sequence
demo
```

Creating the coroutine starts it until the first `yield`. Calling the coroutine command resumes it.

## Cooperative, not parallel

A coroutine does not create a thread. It runs until it yields or returns. A coroutine that blocks still blocks the interpreter.

## Values across yield

`yield` can return a value when the coroutine is resumed, allowing a workflow to receive its next event explicitly.

## Lifecycle

When the coroutine procedure returns, its coroutine command disappears. Code must not assume it can resume a completed coroutine.

## Security

Coroutines change control flow, not trust boundaries. Untrusted data remains data and resource limits still apply.

## Mastery

Explain the difference between a coroutine, a callback and a thread.
