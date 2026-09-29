# 15 — DCC Concepts

DCC is a separate interaction surface from public IRC commands.

That means a separate threat model:

- who can reach it;
- how identity is established;
- which commands are exposed;
- what data can leave the bot;
- how sessions end.

Do not assume that a command is safe merely because it is not public-channel facing.
