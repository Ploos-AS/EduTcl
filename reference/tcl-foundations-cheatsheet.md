# Tcl Foundations Cheat Sheet

## Commands and substitution

- command separator: newline or `;`
- variable substitution: `$name`
- command substitution: `[command]`
- quoted grouping: `"..." ` with substitutions
- braced grouping: `{...}` suppresses normal substitutions while parsing that word

## Core commands introduced in M1

`set`, `puts`, `string`, `expr`, `list`, `llength`, `lindex`, `lappend`, `lsearch`, `lrange`, `lsort`, `foreach`, `if`, `while`, `for`, `incr`, `proc`, `return`, `global`, `array`, `dict`, `error`, `catch`, `open`, `read`, `gets`, `close`.

## Habits

- Predict evaluation before debugging it.
- Prefer braced expressions.
- Build lists with list operations.
- Keep user data as data.
- Pass dependencies explicitly when practical.
- Do not silently swallow unexpected errors.
- Separate core logic from transport-specific I/O.
