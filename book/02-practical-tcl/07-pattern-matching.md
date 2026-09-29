# 7 — Glob and string pattern matching

Not every text problem needs a regular expression.

## Exact comparison

Use operators such as `eq` when you mean exact string equality.

## string match

```tcl
string match -nocase "help*" $command
```

This uses glob-style patterns, not regular expressions.

Common glob metacharacters include `*`, `?`, and character classes.

## lsearch

For list data, `lsearch` supports several matching modes. Choose the mode deliberately, for example `-exact`, `-glob`, or `-regexp`.

## Choose the smallest language

If exact comparison solves the problem, use exact comparison. If a simple glob expresses it clearly, a regexp may add unnecessary complexity. Use regexp when its expressive power is actually useful.

## Security and correctness

Pattern syntax is a language. If untrusted data becomes pattern syntax, users may influence matching semantics. Keep a clear distinction between the pattern and the value being matched.

## Exercise

Implement three filters over a list of command names: exact, glob, and regexp. Demonstrate an input where the three intentionally produce different results.
