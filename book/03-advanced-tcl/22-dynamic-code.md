# 22 — Dynamic Code: eval, uplevel and upvar

Tcl makes dynamic programming easy. That power is useful, but bot developers must understand exactly when data becomes code.

## eval

`eval` evaluates a constructed Tcl script. Most callback dispatch does not need it.

Prefer command prefixes:

```tcl
set callback [list ::module::command $message]
{*}$callback
```

over assembling source text.

If IRC text is concatenated into an `eval` script, the bot has crossed a dangerous data-to-code boundary.

## uplevel

`uplevel` evaluates code in another stack frame. It is useful for carefully designed control abstractions, but it creates non-local behavior that deserves documentation and tests.

## upvar

`upvar` creates an alias to a variable in another scope. It can support efficient APIs and control structures, but it also couples scopes.

## Rule for bot code

Dynamic evaluation must be justified, localized and reviewed. Never use it merely because parsing a command prefix or passing structured data seems inconvenient.

## TiCle connection

A command such as `!calc` must not be implemented by feeding arbitrary IRC text to Tcl `expr` or `eval` without a deliberately restricted grammar and threat model.

## Mastery

Identify every point in a design where external text can become executable Tcl and explain why that transition is necessary or remove it.
