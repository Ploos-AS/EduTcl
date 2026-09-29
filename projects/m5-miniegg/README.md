# M5 MiniEgg

MiniEgg is a deliberately small Eggdrop API mock for EduTcl.

It exists so introductory Eggdrop scripts can be exercised with ordinary `tclsh` and no network connection.

## Scope

M5 starts with:

- recording `bind` registrations;
- dispatching public commands;
- recording `putserv`, `puthelp` and `putquick` output.

It is not an Eggdrop emulator and must not become one. Real Eggdrop qualification remains a separate concern.
