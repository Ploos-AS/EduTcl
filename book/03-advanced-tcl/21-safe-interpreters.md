# 21 — Safe Interpreters: Capabilities and Limits

Tcl can create a safe interpreter:

```tcl
set child [interp create -safe]
```

A safe interpreter hides commands considered unsafe and starts with reduced authority.

## Capability design

Useful sandboxing is not "make it safe, then expose everything back." Grant narrowly scoped operations.

For example, instead of exposing raw file access, a host might expose one alias that retrieves a specific approved value.

## Safe does not mean omnipotently secure

A safe interpreter is one layer. Security still depends on:

- which aliases/capabilities the host grants;
- resource consumption;
- extension behavior;
- Tcl/runtime vulnerabilities;
- denial-of-service considerations;
- host application mistakes.

For hostile code requiring strong containment, OS-level isolation may also be necessary.

## Resource exhaustion

Code that cannot open files may still consume CPU or memory. Capability restriction and resource control are different problems.

## Bot/plugin relevance

Later plugin systems can use these ideas to reason about trust. We will not claim that arbitrary third-party bot code becomes safe merely because it runs in a Tcl safe interpreter.

## Mastery

Given a plugin that needs only a key/value lookup and a way to emit a bounded response, design the smallest host capabilities it requires.
