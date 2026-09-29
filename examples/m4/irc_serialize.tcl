namespace eval ::irc {}

proc ::irc::clean_field {value what} {
    if {[string first "\r" $value] >= 0 || [string first "\n" $value] >= 0} {
        return -code error -errorcode [list IRC SERIALIZE NEWLINE $what] "$what contains CR/LF"
    }
    return $value
}

proc ::irc::serialize {command {middle {}} {trailing __IRC_NO_TRAILING__}} {
    clean_field $command command
    if {$command eq "" || [regexp {[:[:space:]]} $command]} {
        return -code error -errorcode {IRC SERIALIZE COMMAND} "invalid IRC command"
    }

    set words [list [string toupper $command]]
    foreach param $middle {
        clean_field $param parameter
        if {$param eq "" || [string index $param 0] eq ":" || [regexp {[[:space:]]} $param]} {
            return -code error -errorcode {IRC SERIALIZE MIDDLE} "invalid middle parameter"
        }
        lappend words $param
    }

    set line [join $words " "]
    if {$trailing ne "__IRC_NO_TRAILING__"} {
        clean_field $trailing trailing
        append line " :" $trailing
    }
    return $line
}

puts [::irc::serialize NICK [list EduBot]]
puts [::irc::serialize USER [list edubot 0 *] "EduTcl teaching bot"]
puts [::irc::serialize PRIVMSG [list #tcl] "hello world"]
