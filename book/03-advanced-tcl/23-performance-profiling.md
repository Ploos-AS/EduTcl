# 23 — Performance Measurement and Profiling

Optimize evidence, not intuition.

Useful first tools include `time`, counters, timestamps and carefully scoped instrumentation.

```tcl
puts [time {
    set x [lsort $values]
} 100]
```

## Event-loop latency matters

For a bot, average throughput is not the only concern. A callback that occasionally blocks for a long time can delay PING handling, timers and unrelated commands.

Measure:

- callback duration;
- queue depth;
- message rate;
- timer lateness;
- reconnect frequency;
- cache hit/miss behavior where relevant.

## Do not benchmark I/O carelessly

Network and disk measurements include external effects. Separate pure computation from I/O where possible.

## Instrumentation cost

Logging and metrics themselves consume resources. Keep high-volume diagnostics bounded and configurable.

## TiCle cookbook connection

Useful modules such as URL inspection, RSS, statistics and API integrations should expose enough metrics to diagnose slow or failing dependencies without leaking secrets.

## Mastery

Given a slow bot command, design measurements that distinguish parsing, computation, queueing and external I/O.
