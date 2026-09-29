# 16 — Bot Identity and Channel Context

Callbacks provide context because the same script may operate across many channels and users.

Do not hard-code a channel into reusable command logic unless the feature is intentionally channel-specific.

Keep these concepts separate:

- bot identity;
- source nickname;
- source userhost;
- Eggdrop handle;
- channel;
- command text.

This separation becomes essential for multi-channel bots and TiCle modules later.
