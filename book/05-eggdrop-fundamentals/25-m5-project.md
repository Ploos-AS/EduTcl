# 25 — M5 Project and Assessment

Build an Eggdrop Tcl module that is useful on a small IRC channel.

## Required

- namespace-owned implementation;
- explicit init and shutdown;
- at least one public command;
- at least one flag-protected operation;
- safe output helper;
- bounded in-memory state;
- no data-to-code evaluation;
- tests runnable without an IRC network;
- short architecture/security explanation.

## Explain

You must be able to trace one command from IRC concept to Eggdrop bind to callback to ordinary Tcl logic to outbound response.

You must also explain the difference between nickname, userhost, handle and flags.

## Qualification

M5 is complete only after its automated tests pass in a Tcl runtime. Real Eggdrop integration is a separate qualification target and must not be claimed from MiniEgg tests alone.
