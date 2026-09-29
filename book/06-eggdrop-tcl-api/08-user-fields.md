# 8 — User-Defined Fields

Feature metadata sometimes belongs with a bot user; sometimes it belongs in module-owned storage.

Before adding a field ask:

- is it truly user-scoped?
- is it sensitive?
- who may read/write it?
- what is its migration story?
- does deleting a user need to delete this data?

Convenience is not a data-retention policy.
