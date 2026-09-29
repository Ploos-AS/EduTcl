# 3 — Tcl Inside Eggdrop

Eggdrop embeds Tcl, so normal Tcl knowledge from M1–M3 still matters: lists, dictionaries, namespaces, procedures, errors and event-driven design.

Eggdrop adds commands supplied by the host application.

That means a script can have two kinds of dependencies:

- Tcl itself;
- Eggdrop-specific commands such as bind and output functions.

Keep that boundary visible. It makes scripts easier to test outside Eggdrop.

## Rule

Put reusable computation in ordinary Tcl procedures. Keep Eggdrop-specific adapters thin.
