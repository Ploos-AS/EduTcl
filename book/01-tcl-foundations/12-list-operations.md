# 12 — Working with lists

Once data is represented as a proper Tcl list, Tcl provides commands that preserve its structure.

## Add elements

```tcl
set channels [list "#tcl" "#eggdrop"]
lappend channels "#bots"
```

## Iterate

```tcl
foreach channel $channels {
    puts "Channel: $channel"
}
```

## Search and transform

Explore:

```tcl
lsearch -exact $channels "#eggdrop"
lsort $channels
lrange $channels 0 1
```

Later we cover richer `lsearch`, `lsort`, `lmap`, filtering, and nested structures.

## Replace and insert

Learn `linsert` and `lreplace` rather than converting structured data into ad-hoc text and reparsing it.

## Expansion preview

Modern Tcl has argument expansion:

```tcl
set words [list one two three]
puts [join $words ", "]
```

The `{*}` expansion operator will later let a list supply multiple command arguments safely. We defer its full treatment until the evaluation model is mature enough to contrast it carefully with legacy `eval` idioms.

## Eggdrop connection

Many Eggdrop commands return or consume list-shaped data. Correct list handling prevents subtle bugs involving masks, handles, channel data, and command arguments.

## Mastery exercise

Build a channel registry as a list. Add, remove, search, sort, and iterate entries without manually assembling list syntax.
