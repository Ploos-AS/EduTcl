# 2 — Tclsh and the interactive interpreter

Before using Eggdrop, we need a place where Tcl can be explored quickly. That place is `tclsh`.

## Interactive use

Start:

```text
tclsh
```

Then enter:

```tcl
puts "Hello"
```

The interpreter evaluates the command immediately.

Try:

```tcl
set nick Alice
puts $nick
```

Do not worry about every detail yet. Observe that `set` stores a value and `$nick` causes Tcl to substitute that value.

## Scripts

Interactive experimentation is useful, but programs belong in files:

```tcl
set nick Alice
puts "Hello, $nick"
```

Save this as `greeting.tcl` and run:

```text
tclsh greeting.tcl
```

## Experiment, predict, verify

Throughout EduTcl use this loop:

1. Read the code.
2. Predict what Tcl will do.
3. Run it.
4. Compare the result with your prediction.
5. Explain any difference.

Tcl's evaluation rules become much easier when you actively predict them.

## Useful introspection

You can ask the interpreter for its Tcl version:

```tcl
puts [info patchlevel]
```

Later we will use `info` extensively for debugging and introspection.

## A deliberate error

Try:

```tcl
this_command_does_not_exist
```

Read the error rather than treating it as failure. Learning to interpret Tcl errors is part of learning Tcl.

## Lab

Create a file that:

- stores your chosen IRC nickname in a variable;
- prints a greeting containing that nickname;
- prints the Tcl patch level.

Run it with `tclsh`.

## Eggdrop connection

Eggdrop embeds its own Tcl interpreter, so not every Eggdrop environment will exactly match the `tclsh` installed on your host. Later we will learn to inspect the runtime rather than assume versions or available packages.

## Checkpoint

You can now use both interactive `tclsh` and Tcl script files and can deliberately inspect the interpreter version.
