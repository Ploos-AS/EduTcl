# 17 — IRC Casemapping

IRC identity comparison is not always ordinary Tcl `string tolower`. Networks can define a casemapping through ISUPPORT. Traditional IRC casemappings may treat additional ASCII punctuation pairs as equivalent.

## Canonical keys

When storing nicknames or channel names in dictionaries, derive a canonical comparison key using the active network casemapping. Preserve display spelling separately.

```tcl
dict set users [::irc::casefold $nick $casemapping] [dict create nick $nick]
```

A multi-network bot must not use one global normalization rule for every connection. If network properties change, cached canonical keys may need rebuilding.

## Mastery

Explain why Tcl's default lowercase operation is not a complete IRC identity model.
