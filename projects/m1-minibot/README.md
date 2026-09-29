# MiniBot Core

M1 capstone project for EduTcl.

Build a standalone command-driven Tcl application that demonstrates the complete foundations curriculum before Eggdrop is introduced.

## Architecture target

```text
stdin -> adapter -> dispatcher -> command procedures
                            -> state
stdout <- adapter <- result
```

Start from your own implementation. A reference implementation will be introduced only after the exercise path so learners do not accidentally turn the capstone into a copy-and-run task.

## Qualification cases

The completed project should be tested with normal commands, unknown commands, empty input, Unicode, whitespace-heavy input, and Tcl-looking input such as dollar signs, brackets, braces, semicolons, and backslashes.
