# 5 — Parameters and the Trailing Parameter

IRC commands can carry parameters separated by spaces.

The final parameter has a special representation when it needs spaces or certain forms:

```text
PRIVMSG #tcl :hello from EduTcl
```

The logical parameters are:

```tcl
{#tcl} {hello from EduTcl}
```

not five words.

## Empty trailing parameter

A trailing parameter may be empty:

```text
COMMAND :
```

A correct parser must distinguish that from no parameter at all.

## Do not split blindly

Plain `split $line` loses the trailing-parameter grammar. Parse the prefix/command/middle parameters while recognizing the first trailing-field marker in the correct position.

## Outbound injection

When generating messages, never let untrusted values inject CR or LF and thereby create additional protocol lines.

## Mastery

Parse examples with zero, one and multiple middle parameters and with both non-empty and empty trailing parameters.
