# 11 — Structured errors with try, trap and options

An error message is for humans. Programs often need a stable machine-readable category too.

```tcl
return -code error -errorcode {EDUTCL CONFIG MISSING} "configuration missing"
```

A caller can handle selected error classes with `try` and `trap`.

```tcl
try {
    load_config
} trap {EDUTCL CONFIG} {message options} {
    puts stderr "configuration problem: $message"
}
```

## Error options

Tcl error handling carries metadata such as `-errorcode` and `-errorinfo`. Inspect options rather than parsing human-readable error strings.

## Catch narrowly

Do not convert every programmer bug into “invalid user input.” Handle errors at the boundary that actually understands what they mean.

## Public versus diagnostic messages

A bot may send a concise failure to an IRC user while logging richer diagnostics for operators. Avoid exposing secrets, filesystem paths, credentials, or internal stack details to untrusted users.

## Exercise

Define separate error codes for invalid command arguments and persistence failures. Handle each differently without comparing message text.
