# 6 — Variable substitution

The dollar sign requests variable substitution.

```tcl
set nick Alice
puts $nick
puts "Hello, $nick!"
```

When a variable name needs an explicit boundary, braces can delimit the **variable name**:

```tcl
set stem bot
puts "${stem}net"
```

This is different from bracing an entire word.

```tcl
puts {$nick}
```

That prints the characters `$nick` rather than reading the variable.

## Spaces inside values

```tcl
set greeting "hello from IRC"
puts $greeting
```

The value contains spaces, but substitution does not re-split the already parsed word into multiple arguments. This is fundamental to safe Tcl programming.

## Untrusted-looking data

```tcl
set message {hello $nick [puts surprise]}
puts $message
```

The Tcl-looking characters stored in `message` are data and are not automatically re-evaluated. Explain why before moving on.
