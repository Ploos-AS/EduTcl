# 13 — Output with putserv

`putserv` asks Eggdrop to send an IRC protocol line through its server-output machinery.

Your script should construct one logical IRC line, not append CR/LF itself.

## Boundary

Application logic should prefer a small reply helper over scattering raw `PRIVMSG` construction everywhere.

Even through Eggdrop, user-controlled text must not become extra protocol lines.

## M4 connection

MiniIRC made serialization explicit. Eggdrop owns more of the transport and queueing, but IRC injection is still an application-boundary concern when scripts construct raw lines.
