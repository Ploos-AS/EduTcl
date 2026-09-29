# M2 Lab — Reusable command library

Create a package that exposes a small command registry and at least three command implementations.

Use command prefixes rather than source strings. Give the package a documented public API and structured error codes.

Write isolated `tcltest` tests for success, duplicate registration, unknown commands, callback errors, Unicode, Tcl metacharacters, and reset behavior.

Finally, write a tiny adapter program that consumes the library without reaching into its namespace variables directly.
