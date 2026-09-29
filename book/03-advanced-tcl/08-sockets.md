# 8 — TCP Clients with `socket`

Tcl exposes TCP connections as channels.

```tcl
set chan [socket 127.0.0.1 9000]
fconfigure $chan -blocking 0 -buffering line
fileevent $chan readable [list ::client::readable $chan]
```

Once connected, ordinary channel concepts apply.

## Local first

Course examples use loopback services. This makes tests deterministic, offline and independent of third-party infrastructure.

## Writing

```tcl
puts $chan "hello"
flush $chan
```

Buffering policy determines when bytes are emitted. Never assume application writes map one-to-one to network packets.

## Errors and EOF

A remote close is normal lifecycle information, not necessarily a program bug. Code should distinguish connection failure, clean EOF and protocol failure.

## Security

Connecting to a host supplied by an untrusted user can become an SSRF-style capability. A bot should not automatically turn arbitrary chat input into network destinations.

## Mastery

Explain how a socket becomes a Tcl channel and which existing channel rules continue to apply.
