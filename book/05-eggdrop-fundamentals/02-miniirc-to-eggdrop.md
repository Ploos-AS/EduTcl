# 2 — From MiniIRC to Eggdrop

M4 used structured messages and explicit dispatch. Eggdrop turns many common events into callback arguments.

A raw IRC PRIVMSG that becomes a public command is conceptually transformed into context such as nickname, userhost, Eggdrop handle, channel and command text.

This is dependency inversion: application code receives useful context instead of parsing the wire.

## Exercise

For each MiniIRC layer, mark it as:

- owned by Eggdrop;
- visible through an Eggdrop API;
- still owned by your module.

Your module should mostly live at the application layer.
