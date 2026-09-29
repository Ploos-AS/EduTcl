# 5 — Tcl's evaluation model

This is one of the most important chapters in the course.

For ordinary Tcl commands, use this working model:

1. identify a command;
2. parse it into words;
3. perform the substitutions permitted for each word;
4. use the first resulting word as the command name;
5. pass the remaining resulting words as arguments;
6. execute the command and obtain its result.

```tcl
set nick Alice
puts "Hello, $nick"
```

For the second command, the quoted word permits substitution, so `$nick` becomes `Alice` before `puts` is invoked.

## Nested evaluation

```tcl
puts "Length: [string length $nick]"
```

The bracketed script is evaluated and its result becomes part of the surrounding word.

## Data is not automatically code

A string merely containing Tcl syntax is not automatically executed. This distinction becomes critical when IRC supplies untrusted nicknames, hostmasks, messages, CTCP data, and command arguments.

Later we will study the places where programs deliberately request additional evaluation, including `eval` and argument expansion, and how to avoid turning untrusted data into code.

## Prediction drill

```tcl
set who Bob
set n [string length $who]
puts "$who has $n letters"
```

Identify every command evaluation, every substitution, and the final arguments passed to `puts` before running it.
