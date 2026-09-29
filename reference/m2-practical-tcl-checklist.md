# M2 Practical Tcl Checklist

A learner ready to leave M2 can explain and demonstrate:

- namespace command and variable resolution;
- state ownership;
- robust multi-file loading;
- package names, versions, and discovery;
- exact, glob, and regexp matching;
- channel ownership and configuration;
- encoding, translation, and buffering;
- guaranteed cleanup with `try/finally`;
- structured errors and `trap`;
- argument expansion with `{*}`;
- command prefixes and callback contracts;
- safe, limited introspection;
- list transformations;
- configuration versus runtime state;
- public library APIs;
- isolated tests and failure-path tests;
- transport-neutral bot core design.

The learner should be able to refactor a standalone bot core without introducing string-based dynamic evaluation.
