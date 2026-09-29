# 6 — User Database API

Eggdrop's user database gives scripts a durable bot-level identity model.

Use it deliberately for features that need durable identity or authorization. Do not create user records merely because somebody spoke in a channel.

Keep public IRC data and private administrative metadata conceptually separate.

M6 focuses on API boundaries; persistence policy is developed further in M7.
