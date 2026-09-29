namespace eval ::irc::connection {
    variable state registering
    variable nick EduBot
}

proc ::irc::connection::handle {msg} {
    variable state
    variable nick

    set command [dict get $msg command]
    set params [dict get $msg params]

    switch -exact -- $command {
        PING {
            if {[llength $params] != 1} {
                return -code error -errorcode {IRC PROTOCOL PING} "invalid PING"
            }
            return [list send [::irc::serialize PONG {} [lindex $params 0]]]
        }
        001 {
            set state online
            if {[llength $params]} {
                set nick [lindex $params 0]
            }
            return [list state $state]
        }
        default {
            return [list ignored $command]
        }
    }
}
