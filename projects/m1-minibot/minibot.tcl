namespace eval ::minibot {
    variable state [dict create count 0 channels [list "#tcl" "#eggdrop"]]
}

proc ::minibot::normalize {name} {
    return [string tolower [string trim $name]]
}

proc ::minibot::dispatch {name args} {
    variable state
    set command [normalize $name]
    dict incr state count

    switch -exact -- $command {
        hello {
            set who [expr {[llength $args] ? [lindex $args 0] : "world"}]
            return "Hello, $who"
        }
        help {
            return [list hello help about count channels quit]
        }
        about {
            return "EduTcl MiniBot Core"
        }
        count {
            return [dict get $state count]
        }
        channels {
            return [dict get $state channels]
        }
        quit {
            return -code return quit
        }
        default {
            return -code error -errorcode [list MINIBOT UNKNOWN $command] "unknown command: $command"
        }
    }
}

proc ::minibot::save {path} {
    variable state
    set f [open $path w]
    try {
        puts $f $state
    } finally {
        close $f
    }
}

proc ::minibot::load {path} {
    variable state
    set f [open $path r]
    try {
        set candidate [read $f]
    } finally {
        close $f
    }
    if {[catch {dict size $candidate}]} {
        error "invalid MiniBot state"
    }
    set state $candidate
}

proc ::minibot::run {} {
    while {[gets stdin line] >= 0} {
        set line [string trim $line]
        if {$line eq ""} continue
        set words [split $line]
        set command [lindex $words 0]
        set args [lrange $words 1 end]
        if {[normalize $command] eq "quit"} {
            puts "bye"
            break
        }
        if {[catch {dispatch $command {*}$args} result options]} {
            puts "error: $result"
        } else {
            puts $result
        }
    }
}

if {[file normalize [info script]] eq [file normalize $argv0]} {
    ::minibot::run
}
