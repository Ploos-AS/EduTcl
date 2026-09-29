# 6 — Public Command Binds

Public binds are a common way to implement channel commands.

Keep the Eggdrop-facing callback small:

```text
callback -> validate context -> ordinary Tcl logic -> safe output API
```

Do not make authorization decisions from nickname text alone. Eggdrop handles and flags exist for a reason, and later chapters develop that model carefully.

## First pattern

A command such as `!hello` should accept arbitrary text as data, produce bounded output, and never evaluate user input.
