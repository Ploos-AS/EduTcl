# 11 — Lists: Tcl's central data structure

Lists are fundamental Tcl values and appear everywhere in Tcl and Eggdrop APIs.

A list is not merely “a string with spaces.” Tcl lists have a defined syntax that lets individual elements safely contain spaces and special characters.

## Construct lists with list

```tcl
set users [list Alice Bob Carol]
puts $users
```

Elements may contain spaces:

```tcl
set users [list Alice "Bob Smith" {Carol [admin]}]
```

The `list` command constructs a valid list representation for you.

## Read elements

```tcl
puts [llength $users]
puts [lindex $users 0]
puts [lindex $users 1]
```

Indices begin at zero. Tcl also supports useful index forms such as `end`, which we cover through exercises.

## Why string concatenation is wrong

Avoid constructing structured lists like this:

```tcl
set users "$nick $othernick"
```

It may appear to work until an element contains whitespace, braces, backslashes, or other syntax-relevant characters.

Prefer:

```tcl
set users [list $nick $othernick]
```

The distinction is crucial when values originate from IRC.

## Lists are data

A list containing text that resembles Tcl code remains data unless your program explicitly evaluates it.

## Exercise

Create a list containing:

- a normal nickname;
- a nickname containing a space for demonstration purposes;
- literal dollar signs;
- literal square brackets;
- braces.

Use `list`, then retrieve every element with `lindex` and verify that each value survives unchanged.
