# 10 — Scheduling Patterns

Short-delay scheduling is useful for deferred work, retries and coalescing.

Good scheduling code defines:

- owner;
- maximum outstanding work;
- cancellation;
- retry limit;
- shutdown behavior.

A retry loop without a bound is a resource leak with a clock attached.
