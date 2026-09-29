# 13 — KICK, TOPIC and MODE

Channel state is more than membership. KICK removes a member, TOPIC changes/reports topic, and MODE can alter channel modes or user status.

Examples:

```text
:op!u@h KICK #tcl alice :reason
:alice!u@h TOPIC #tcl :New topic
:op!u@h MODE #tcl +o alice
```

## MODE is contextual

Do not treat a MODE string as independent characters with universal parameter rules. Which modes consume parameters can depend on server/network capabilities. A serious implementation needs network knowledge, including ISUPPORT information introduced later.

Keep raw parsed parameters available, then have a state layer interpret events according to known network rules. Seeing `+o` in a string is not sufficient authorization logic; maintain current channel state and define explicit privilege policy.

## Mastery

Explain why MODE parsing belongs above generic IRC message parsing.
