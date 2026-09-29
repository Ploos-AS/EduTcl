namespace eval ::demo {
    variable done 0
    variable received {}
}

proc ::demo::accept {chan addr port} {
    fconfigure $chan -buffering line -encoding utf-8 -translation lf
    puts $chan "hello from server"
    close $chan
}

proc ::demo::readable {chan} {
    variable received
    variable done
    if {[gets $chan line] >= 0} {
        lappend received $line
    }
    if {[eof $chan]} {
        fileevent $chan readable {}
        close $chan
        set done 1
    }
}

set server [socket -server [list ::demo::accept] -myaddr 127.0.0.1 0]
set port [lindex [fconfigure $server -sockname] 2]

set client [socket 127.0.0.1 $port]
fconfigure $client -blocking 0 -buffering line -encoding utf-8 -translation auto
fileevent $client readable [list ::demo::readable $client]

set watchdog [after 1000 [list set ::demo::done timeout]]
vwait ::demo::done
after cancel $watchdog
close $server

if {$::demo::done eq "timeout"} {
    error "loopback demo timed out"
}

puts $::demo::received
