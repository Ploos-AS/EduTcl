# Modular MiniBot

M2 capstone: turn the M1 command bot into a maintainable multi-file Tcl application.

## Target

```text
adapter -> registry -> command prefix
              |             |
            metadata       logic
              |
            state/config boundaries
```

The project is intentionally transport-neutral. Standard input/output is only the first adapter. A later Eggdrop adapter should not require rewriting the command core.

## Qualification

Run unit tests for each public module plus integration tests covering dispatch, state, persistence, configuration, unusual user data, and failure paths.

A reference implementation will be added after the learner-facing architecture and tests are established.
