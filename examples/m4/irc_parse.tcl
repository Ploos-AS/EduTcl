namespace eval ::irc {}

proc ::irc::parse {line} {
    if {[string first "\r" $line] >= 0 || [string first "\n" $line] >= 0} {
        return -code error -errorcode {IRC PARSE NEWLINE} "logical IRC line contains CR/LF"
    }

    set rest $line
    set prefix ""

    if {[string match ":*" $rest]} {
        set space [string first " " $rest]
        if {$space < 0} {
            return -code error -errorcode {IRC PARSE PREFIX} "prefix without command"
        }
        set prefix [string range $rest 1 [expr {$space - 1}]]
        set rest [string trimleft [string range $rest [expr {$space + 1}] end]]
    }

    if {$rest eq ""} {
        return -code error -errorcode {IRC PARSE COMMAND} "missing command"
    }

    set space [string first " " $rest]
    if {$space < 0} {
        set command $rest
        set rest ""
    } else {
        set command [string range $rest 0 [expr {$space - 1}]]
        set rest [string trimleft [string range $rest [expr {$space + 1}] end]]
    }

    set params {}
    while {$rest ne ""} {
        if {[string index $rest 0] eq ":"} {
            lappend params [string range $rest 1 end]
            set rest ""
            break
        }
        set space [string first " " $rest]
        if {$space < 0} {
            lappend params $rest
            set rest ""
        } else {
            lappend params [string range $rest 0 [expr {$space - 1}]]
            set rest [string trimleft [string range $rest [expr {$space + 1}] end]]
        }
    }

    set msg [dict create raw $line prefix $prefix command [string toupper $command] params $params]

    if {$prefix ne "" && [regexp {^([^!]+)!([^@]+)@(.+)$} $prefix -> nick user host]} {
        dict set msg nick $nick
        dict set msg user $user
        dict set msg host $host
    }

    return $msg
}

set msg [::irc::parse {:alice!u@example PRIVMSG #tcl :hello world}]
puts "command = [dict get $msg command]"
puts "nick    = [dict get $msg nick]"
puts "params  = [dict get $msg params]"
