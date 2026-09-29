# 5 — Channel Member API

Membership queries answer questions about observed channel state, not permanent identity.

A member has several relevant representations: nick, userhost, possibly an Eggdrop handle, and channel privileges/state.

Do not turn a membership lookup into an authorization shortcut.

## Snapshot rule

Treat a result as a snapshot. IRC state can change immediately after you query it.
