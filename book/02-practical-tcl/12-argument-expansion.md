# 12 — Argument expansion with {*}

Suppose a list contains arguments for a command:

```tcl
set args [list Alice Hi]
puts [greeting {*}$args]
```

`{*}` expands the list elements into separate words for the surrounding command.

## Structure, not string evaluation

This is fundamentally different from building a script string and evaluating it.

```tcl
set args [list {$name} {[puts BAD]}]
someCommand {*}$args
```

The list elements become arguments. Their contents do not receive an extra Tcl evaluation merely because they contain Tcl-looking characters.

## Legacy eval idioms

Older Tcl code may use `eval` to combine a command and argument list. You need to recognize that style, but modern Tcl often expresses structured expansion more clearly with `{*}`.

## Security significance

Keep code structure as code and data structure as lists. Avoid converting data into source text merely to invoke a command.

## Exercise

Call a procedure with arguments containing spaces, dollar signs, brackets, semicolons, and braces using `{*}`. Explain exactly how many evaluation rounds occur.
