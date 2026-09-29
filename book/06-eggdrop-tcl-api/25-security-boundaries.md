# 25 — Security Boundaries

M6 now has several distinct trust boundaries:

```text
IRC user input
DCC/admin input
botnet peer messages
configuration
filesystem
DNS/remote services
Eggdrop host API
module-owned state
```

For each crossing ask:

1. What is the identity?
2. What data is accepted?
3. What is authorized?
4. What is bounded?
5. What is logged?
6. How is failure contained?

## Core rules

- data never becomes Tcl code;
- nickname alone is not authorization;
- remote/botnet data remains untrusted;
- paths remain inside their configured root;
- outstanding asynchronous work is bounded;
- secrets do not enter normal logs or IRC output;
- optional capabilities fail closed or degrade explicitly.
