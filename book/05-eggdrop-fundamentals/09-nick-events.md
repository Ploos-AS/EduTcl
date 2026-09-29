# 9 — Nick Events

Nicknames change.

A nick callback is a reminder that nick text is presentation-level identity, not a durable account identifier.

If a module keeps ephemeral state keyed by nick, it needs an explicit rename policy. If it needs authorization, use the identity/flag mechanisms provided by Eggdrop rather than inventing trust from the spelling of a nick.

## Exercise

Design a reminder table and decide what should happen when the owner changes nick.
