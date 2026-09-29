# M2 Lab — Package, patterns and channels

Build a small reusable Tcl package that validates and normalizes bot command metadata, then writes a report to a UTF-8 text file.

## Package

Expose the functionality through a namespace and `package provide`. Load it from a separate test/driver program with `package require`.

## Matching

Include separate operations demonstrating:

- exact comparison;
- glob matching;
- regular-expression matching.

Document which inputs are treated as data and which values are intentionally pattern syntax.

## Channel work

Write the resulting report using explicit encoding and newline translation. Ensure the channel is closed on both success and failure.

## Tests

Include spaces, Unicode, regexp metacharacters, glob metacharacters, empty strings, malformed values, and enough long input to force you to think about resource policy.

## Reflection

Explain why a package is more than a file, why regexp is not automatically the best matcher, and why text I/O requires an encoding contract.
