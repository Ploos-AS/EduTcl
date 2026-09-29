# 10 — Numbers and expr

Arithmetic and expressions are normally handled by `expr`.

```tcl
set a 10
set b 3
puts [expr {$a + $b}]
puts [expr {$a * $b}]
puts [expr {$a / $b}]
```

## Brace expressions

Prefer:

```tcl
expr {$a + $b}
```

Bracing an expression avoids an unnecessary round of Tcl-level substitution before `expr` processes the expression and is the standard idiom.

## Integer versus floating-point behavior

Run and explain:

```tcl
puts [expr {10 / 3}]
puts [expr {10.0 / 3}]
```

Never guess which numeric behavior your bot depends on; make it explicit and test it.

## Boolean expressions

Expressions also power conditions:

```tcl
set count 5
if {$count >= 5} {
    puts "threshold reached"
}
```

We study `if` fully in the control-flow chapter.

## IRC exercise

Given a message counter, increment it safely and test whether a configured threshold has been reached.

## Security preview

Expression handling has historical traps in old Tcl coding styles. Our rule is not “memorize scary syntax”; it is to understand evaluation stages, brace expressions idiomatically, and avoid treating untrusted input as program structure.
