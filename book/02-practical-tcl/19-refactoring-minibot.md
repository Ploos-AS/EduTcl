# 19 — Refactoring MiniBot

M1's MiniBot proved Tcl fundamentals. M2 now separates its responsibilities.

## Target components

```text
main
 |
 +-- config
 +-- registry
 +-- commands
 +-- state
 +-- adapter
```

The registry maps names to command prefixes. Command procedures receive explicit inputs. State has an owner. The adapter deals with standard input/output.

## Dependency rule

Core commands should not read directly from stdin or print directly to stdout. The adapter translates transport events into application calls and application results back into output.

## Why this matters

When Eggdrop arrives, we should be able to replace the stdin/stdout adapter with Eggdrop callbacks while retaining much of the registry, command, validation, and state logic.

## Refactoring discipline

Keep tests green while moving responsibilities. A refactor changes structure without intentionally changing externally visible behavior.

## Review

Compare M1 and M2 MiniBot designs and identify every dependency that became more explicit.
