# 3 — Bot and Server State

Bot code often needs facts about the current connection and bot identity.

Separate host-owned runtime facts from module configuration and from IRC user input.

A useful service layer can expose normalized questions such as:

- are we connected?
- what nick is the bot currently using?
- which network context is active?

Code above that layer should not need to know how each fact is retrieved.
