# 13 — Control flow

Tcl control structures are commands. This becomes much easier to understand once you already know commands, words, substitution, and braced script bodies.

## if

```tcl
set count 7

if {$count >= 10} {
    puts "busy"
} elseif {$count > 0} {
    puts "active"
} else {
    puts "idle"
}
```

Prefer braced expressions and braced bodies.

## while

```tcl
set n 0
while {$n < 3} {
    puts $n
    incr n
}
```

## for

```tcl
for {set n 0} {$n < 3} {incr n} {
    puts $n
}
```

## foreach

For Tcl data, `foreach` is often especially natural:

```tcl
foreach channel [list "#tcl" "#eggdrop" "#bots"] {
    puts "checking $channel"
}
```

## break and continue

Use `break` to leave a loop and `continue` to move to its next iteration. Keep control flow obvious; clever nesting becomes difficult to maintain in long-running bots.

## Eggdrop preview

A bot callback commonly decides what to do based on channel, flags, command arguments, configuration, or current state. Those decisions should remain ordinary, testable Tcl logic wherever possible.

## Exercise

Given a list of channel names, print only names beginning with `#`. Count them and stop after three matches.
