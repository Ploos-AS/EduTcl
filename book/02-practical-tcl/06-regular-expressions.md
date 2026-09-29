# 6 — Regular expressions

Regular expressions describe text patterns. Tcl provides `regexp` for matching and `regsub` for substitution.

```tcl
set text "ticket-1234"
if {[regexp {^ticket-([0-9]+)$} $text -> number]} {
    puts "ticket $number"
}
```

The `->` variable is a common convention for discarding the complete match while capturing subexpressions.

## Braces matter

Regular expressions contain many characters that also have meaning to Tcl. Bracing a static pattern usually makes the two languages easier to reason about:

```tcl
regexp {^[A-Za-z][A-Za-z0-9_-]*$} $name
```

## Matching is not validation by accident

Decide whether the entire value must match. Anchors such as `^` and `$` may be necessary for a validation policy.

## Dynamic patterns

If user data is inserted into a regular expression, it can change the pattern's meaning. Treat pattern construction as its own boundary; do not assume arbitrary text is literal regexp text.

## Bot-shaped exercise

Extract a numeric issue ID from a deliberately defined command argument format. Test valid input, partial matches, empty input, very long input, and Unicode.
