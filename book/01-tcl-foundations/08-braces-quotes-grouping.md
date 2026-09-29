# 8 — Braces, quotes and grouping

Many Tcl bugs come from treating braces and double quotes as interchangeable decoration. They are not.

Both can group whitespace into one word, but their substitution rules differ.

## Double quotes

```tcl
set nick Alice
puts "Hello $nick"
puts "Length: [string length $nick]"
```

Substitution occurs.

## Braces

```tcl
puts {Hello $nick}
puts {Length: [string length $nick]}
```

Variable and command substitution are suppressed while the braced word is parsed.

## Control structures preview

```tcl
if {$count > 10} {
    puts "large"
}
```

Braces control when evaluation happens. Later we explain precisely why braced expressions and script bodies are the normal idiom.

## Mastery drill

For every word ask: how is it grouped, which substitutions are permitted, what exact value results, and which command receives it?

This skill is foundational for debugging Eggdrop and understanding TiCle internals.
