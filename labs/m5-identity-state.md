# Lab — Identity, Authorization and State

## Goal

Demonstrate that nickname, userhost, handle and flags answer different questions.

## Tasks

1. Register two handles in MiniEgg with different flags.
2. Give them nicknames that look deceptively similar.
3. Show that authorization follows the handle/flag model, not nickname spelling.
4. Add both users to a channel.
5. Rename one nick and verify membership follows the rename.
6. Remove one member and verify only that membership disappears.
7. Reset/disconnect the mock state and verify ephemeral channel membership is gone.

## Explain

Write a short answer for each:

- Why is nick equality not authorization?
- Why should reconnect invalidate cached membership?
- Which data would you persist, and which would you rebuild?
