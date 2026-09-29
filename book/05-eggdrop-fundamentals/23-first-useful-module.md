# 23 — First Useful Eggdrop Module

The M5 useful module is a small channel note board.

Commands:

- `!note add <text>`
- `!note list`
- `!note clear` for an authorized operator

The teaching goals are more important than feature count:

- namespace-owned state;
- thin bind callbacks;
- bounded data;
- no eval;
- explicit authorization;
- bounded output;
- init/shutdown lifecycle;
- deterministic tests.

Persistence is intentionally deferred. M7 treats persistence as a first-class problem.
