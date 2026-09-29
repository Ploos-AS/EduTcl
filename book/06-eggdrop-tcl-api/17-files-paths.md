# 17 — Files and Paths

A filename supplied by a user is untrusted input.

For module-owned storage:

1. choose a configured root;
2. normalize the candidate;
3. verify it remains beneath the root;
4. apply file type/size policy;
5. then open it.

Reject traversal and absolute-path escape. Avoid using a filename as a shell command.

Persistence, atomic replacement and recovery are covered in M7.
