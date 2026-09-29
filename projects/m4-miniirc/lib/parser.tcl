namespace eval ::miniirc::parser {}

proc ::miniirc::parser::parse {line} {
    if {[string first "\r" $line] >= 0 || [string first "\n" $line] >= 0} {
        return -code error -errorcode {MINIIRC PARSE NEWLINE} "logical IRC line contains CR/LF"
    }
    set rest $line
    set tags {}
    set prefix ""

    if {[string match "@*" $rest]} {
        set p [string first " " $rest]
        if {$p < 0} { return -code error -errorcode {MINIIRC PARSE TAGS} "tags without command" }
        set rawtags [string range $rest 1 [expr {$p-1}]]
        foreach item [split $rawtags ";"] {
            set eq [string first "=" $item]
            if {$eq < 0} { dict set tags $item "" } else {
                dict set tags [string range $item 0 [expr {$eq-1}]] [string range $item [expr {$eq+1}] end]
            }
        }
        set rest [string trimleft [string range $rest [expr {$p+1}] end]]
    }

    if {[string match ":*" $rest]} {
        set p [string first " " $rest]
        if {$p < 0} { return -code error -errorcode {MINIIRC PARSE PREFIX} "prefix without command" }
        set prefix [string range $rest 1 [expr {$p-1}]]
        set rest [string trimleft [string range $rest [expr {$p+1}] end]]
    }
    if {$rest eq ""} { return -code error -errorcode {MINIIRC PARSE COMMAND} "missing command" }

    set p [string first " " $rest]
    if {$p < 0} { set command $rest; set rest "" } else {
        set command [string range $rest 0 [expr {$p-1}]]
        set rest [string trimleft [string range $rest [expr {$p+1}] end]]
    }
    set params {}
    while {$rest ne ""} {
        if {[string index $rest 0] eq ":"} { lappend params [string range $rest 1 end]; break }
        set p [string first " " $rest]
        if {$p < 0} { lappend params $rest; break }
        lappend params [string range $rest 0 [expr {$p-1}]]
        set rest [string trimleft [string range $rest [expr {$p+1}] end]]
    }
    set msg [dict create raw $line tags $tags prefix $prefix command [string toupper $command] params $params]
    if {[regexp {^([^!]+)!([^@]+)@(.+)$} $prefix -> nick user host]} {
        dict set msg nick $nick; dict set msg user $user; dict set msg host $host
    }
    return $msg
}
