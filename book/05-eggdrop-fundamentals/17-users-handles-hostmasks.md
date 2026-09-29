# 17 — Users, Handles and Hostmasks

IRC gives you network-visible identity data such as nickname and userhost. Eggdrop can associate an observed user with a bot user record and handle.

These are not interchangeable.

A nickname can change. A userhost can change or be masked. A handle belongs to Eggdrop's user model.

## Authorization

Ask Eggdrop's user/flag model whether an operation is allowed. Do not implement administration with:

```tcl
if {$nick eq "Alice"} { ... }
```

That compares presentation text, not authorization.

MiniEgg intentionally models only a small handle-to-flags relationship. It is enough for unit tests, not a replacement for Eggdrop's real user database.
