# 3 — Your first Tcl programs

A Tcl script is a sequence of commands. Commands are normally separated by newlines or semicolons.

```tcl
puts "one"
puts "two"
```

Every Tcl command produces a result. In interactive `tclsh`, useful results can be observed directly.

## Comments

A comment can begin with `#` where Tcl expects the beginning of a command. We will later refine this rule; `#` is not simply a universal comment character in every context.

## Exercise

Write three commands, predict their execution order, then run them.

## Eggdrop connection

An Eggdrop callback is still Tcl code. Eggdrop changes which commands are available and when procedures are invoked; it does not replace Tcl's language rules.
