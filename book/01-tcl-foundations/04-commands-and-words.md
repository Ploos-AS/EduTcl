# 4 — Commands and words

The most useful first approximation of Tcl syntax is: **a script contains commands; a command contains words.**

```tcl
puts "Hello world"
set nick Alice
```

The first word becomes the command name and the remaining words are arguments. Whitespace normally separates words; grouping allows a word to contain whitespace.

```tcl
puts "Hello world"
puts {Hello world}
```

Quotes and braces both group here, but their substitution behavior differs.

Tcl does not need separate statement syntax for constructs such as `if`, `for`, and `proc`: they participate in the command model too.

## Drill

Count the words before running:

```tcl
set channel "#example"
puts "Channel: $channel"
string length "hello world"
```

Parsing establishes word boundaries before substitution determines their values. A substituted value containing spaces does not normally create extra words.
