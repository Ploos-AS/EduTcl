# 7 — Command substitution

Square brackets request command substitution:

```tcl
set length [string length "Eggdrop"]
puts $length
```

Tcl evaluates the script inside `[ ... ]` and substitutes its result into the surrounding word.

## Nesting

```tcl
puts "Uppercase: [string toupper [string trim "  tcl  "]]"
```

Read nested substitutions from the inside outward. The trim produces `tcl`, uppercase produces `TCL`, and `puts` receives the final surrounding value.

Compare:

```tcl
puts "[string length Eggdrop]"
puts {[string length Eggdrop]}
```

The first performs command substitution. The second passes bracket characters as literal data.

Intermediate variables are often clearer than deeply nested production code. Later Eggdrop examples will use both forms so you learn to read existing scripts as well as write maintainable new ones.
