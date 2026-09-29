# MiniBot reference implementation

Do the capstone before studying `minibot.tcl`.

The reference implementation demonstrates:

- namespace-owned state;
- procedures with explicit inputs;
- dictionary and list state;
- exact command dispatch;
- structured errors;
- `try/finally` for channel cleanup;
- argument expansion with `{*}`;
- a thin standard-I/O adapter.

Some of these mechanisms deliberately preview M2. The learner should identify unfamiliar constructs and then revisit this implementation as those topics are taught.

## Important limitation

The interactive adapter uses a deliberately simple whitespace split. It is **not** an IRC parser and is not intended to define TiCle's future command parsing semantics. Core dispatch accepts already-separated Tcl values so it can be tested independently.

## Security property

The dispatcher does not use `eval` on command names or arguments. Input resembling Tcl syntax remains ordinary data.
