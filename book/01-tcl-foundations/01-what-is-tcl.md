# 1 — What is Tcl?

Tcl is a programming language built around a small, unusual and powerful idea: programs are commands made of words.

Eggdrop embeds a Tcl interpreter. That means an Eggdrop script is not a separate “Eggdrop language”; it is Tcl code running inside Eggdrop, with additional commands supplied by Eggdrop.

This distinction matters throughout EduTcl:

- **Tcl** gives us the language.
- **Eggdrop** embeds Tcl and exposes bot functionality to it.
- **TiCle** builds a larger bot architecture on top of these facilities.

## The first mental model

Consider:

```tcl
puts "Hello, IRC!"
```

There are two words:

1. `puts`
2. `Hello, IRC!`

After Tcl performs the required substitutions, the first word identifies the command and the remaining words become its arguments.

This command-oriented model is the foundation for understanding Tcl. Later it will also explain expressions such as:

```tcl
bind pub - !hello my_command
```

Do not worry about `bind` yet. It is an Eggdrop command. By the time we reach Eggdrop, you will understand the Tcl machinery surrounding it.

## Tcl is dynamic

Tcl values can be manipulated as strings, lists, numbers and other internal representations without requiring the beginner to declare variable types.

That convenience does not mean Tcl has no structure. Good Tcl programs use well-defined data structures and APIs. We will develop those habits from the beginning.

## Why learn Tcl before Eggdrop?

It is possible to copy an Eggdrop script, change a few strings and make it work. That is not the goal of this course.

We want you to be able to answer questions such as:

- Why did substitution happen here?
- Why did braces prevent it?
- Is this value a valid Tcl list?
- What scope is this variable in?
- What happens if an IRC user supplies unusual input?
- Why is `eval` dangerous in this situation?
- How can this callback be tested outside Eggdrop?

Those questions separate copying scripts from understanding them.

## Try it

Create `hello.tcl`:

```tcl
puts "Hello from Tcl"
```

Run:

```text
tclsh hello.tcl
```

Expected output:

```text
Hello from Tcl
```

## Exercise

Change the message. Then add a second `puts` command.

Before running the file, predict exactly what Tcl will print.

## Eggdrop connection

Eggdrop will later provide commands such as `bind`, `putlog` and IRC output commands. Tcl does not know those commands when run in an ordinary `tclsh`.

This fact becomes useful for testing: we can isolate ordinary Tcl logic from Eggdrop-specific integration.

## TiCle connection

TiCle will serve as our real-world case study. As your Tcl knowledge grows, we will revisit increasingly sophisticated pieces of bot architecture and explain why they are designed the way they are.

## Checkpoint

You should now be able to explain, in your own words:

1. what Tcl contributes to an Eggdrop script;
2. what Eggdrop contributes;
3. why learning Tcl itself is necessary for advanced Eggdrop and TiCle development.
