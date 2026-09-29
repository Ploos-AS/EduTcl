# 21 — Putting Tcl foundations together

You now have enough Tcl to build a small structured application.

The important skills are not isolated commands. They are combinations:

- parse commands and words mentally;
- predict substitution;
- choose braces and quotes intentionally;
- use expressions for conditions;
- represent structured data with lists, arrays, and dictionaries;
- separate behavior into procedures;
- understand scope;
- return useful results;
- detect and communicate failures;
- perform basic I/O deliberately.

## Architecture before Eggdrop

A useful bot design separates transport from logic.

```text
input adapter -> parser/router -> command procedure -> structured state/result -> output adapter
```

For M1, standard input and output can be the adapters. Later Eggdrop callbacks and IRC output commands replace those edges while much of the core logic remains testable Tcl.

## Review challenge

Explain why each of these can be dangerous or fragile when used without understanding:

- manual list construction;
- unnecessary global variables;
- accidental extra evaluation;
- ignored errors;
- direct coupling of all logic to output;
- unvalidated file paths.

The goal is not fear of Tcl features. The goal is knowing precisely what the program asks Tcl to do.
