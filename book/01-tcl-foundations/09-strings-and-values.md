# 9 — Strings and values

Tcl is famous for its string-oriented model, but modern Tcl values may have efficient internal representations while retaining a string representation.

For a beginner, the key rule is simpler: commands receive values. Do not confuse a value with the textual syntax that originally produced it.

## String commands

```tcl
set nick "Alice"
puts [string length $nick]
puts [string toupper $nick]
puts [string range $nick 1 3]
```

Explore `string equal`, `string match`, `string first`, `string trim`, and `string map`.

## Equality

Do not assume every comparison should be performed as text. Later we distinguish numeric and string comparisons and introduce idiomatic condition expressions.

## Unicode

IRC software encounters international text. Tcl has strong Unicode facilities, but encodings at I/O boundaries still matter. We introduce the concept here and return to encodings, IRC wire data, and Eggdrop configuration later.

## Exercise

Normalize a user-entered command by trimming surrounding whitespace and converting the command name to lowercase. Keep the argument text separate.

## TiCle connection

Command dispatchers routinely normalize command names while preserving user data. Separating those responsibilities early produces clearer APIs later.
