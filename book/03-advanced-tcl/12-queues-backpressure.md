# 12 — Command Queues and Backpressure

Event-driven does not mean unlimited work.

If producers create work faster than consumers can process it, a queue grows. Without a bound, memory use can grow until the process becomes unhealthy.

## A bounded queue

A queue can be represented as a Tcl list with an explicit maximum.

When full, the design must choose a policy:

- reject new work;
- drop an explicitly disposable item;
- coalesce equivalent work;
- slow or disable the producer;
- disconnect an abusive source.

The correct choice belongs to the protocol and application.

## Do not hide overload

An unbounded queue merely postpones failure. Backpressure makes overload part of the design.

## Fairness

One noisy channel or user should not necessarily monopolize all processing. Later bot architecture may use per-source limits or scheduling.

## IRC relevance

IRC servers enforce flood behavior and rate limits. A future outbound IRC queue must therefore model pacing deliberately rather than writing unlimited lines as quickly as Tcl can generate them.

## Security

Resource limits are security controls. Bound queue length, item size and retry count where untrusted traffic can influence them.

## Mastery

Explain what happens when a producer runs at 100 items/s and a consumer handles 10 items/s, including what your chosen overload policy does.
