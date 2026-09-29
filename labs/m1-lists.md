# M1 List Lab — IRC-shaped data safely

This lab deliberately uses IRC-like values without requiring Eggdrop.

## Goal

Build a small Tcl program that maintains a list of channel names and a list of user-supplied labels.

## Requirements

Use `list`, `lappend`, `llength`, `lindex`, `lsearch`, `lrange`, `lsort`, and `foreach`.

Do not create list structure by joining arbitrary user values with spaces.

Test values containing whitespace, dollar signs, brackets, braces, and backslashes.

## Explain

For every unusual test value, explain why it remains one list element and why Tcl-looking content is not executed.

## Expert habit introduced

Whenever an API says a value is a Tcl list, treat it structurally with list operations. Do not parse it using assumptions about spaces.
