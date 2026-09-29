# 8 — Join, Part and Sign Events

JOIN, PART and QUIT become lifecycle events in Eggdrop's callback model.

These are useful for welcome behavior, ephemeral state and cleanup.

## IRC connection

Recall M4: PART affects one channel; QUIT affects all channels in which the user was observed. Eggdrop's event API saves your script from reparsing those wire messages, but the semantic distinction remains.

## Privacy and noise

Do not turn every join into permanent tracking. Store only state your feature needs.

A welcome script also needs flood/noise policy; correctness is not the same as being pleasant on a busy channel.
