# 7 — Private-Message Binds

Eggdrop can dispatch commands sent directly to the bot.

A private-message callback has different context from a public channel command. Do not invent a channel when there is none.

Keep private commands explicit about:

- who invoked them;
- which Eggdrop handle is associated with the source;
- required flags;
- what output path is appropriate.

Private does not automatically mean trusted.

## Design rule

Separate command logic from delivery. A useful operation may later have both public and private adapters.
