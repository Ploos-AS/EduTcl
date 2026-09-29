namespace eval ::miniegg {
    variable binds {}
    variable output {}
}

proc ::miniegg::reset {} {
    variable binds
    variable output
    set binds {}
    set output {}
}

proc ::bind {type flags mask callback} {
    variable ::miniegg::binds
    lappend ::miniegg::binds [dict create type $type flags $flags mask $mask callback $callback]
    return $callback
}

proc ::miniegg::emit_pub {nick uhost hand chan text} {
    variable binds
    set words [split $text]
    if {![llength $words]} { return 0 }
    set command [lindex $words 0]
    set rest [join [lrange $words 1 end] " "]
    set count 0
    foreach b $binds {
        if {[dict get $b type] ne "pub"} continue
        if {[dict get $b mask] ne $command} continue
        uplevel #0 [list [dict get $b callback] $nick $uhost $hand $chan $rest]
        incr count
    }
    return $count
}

proc ::miniegg::record {kind line} {
    variable output
    if {[regexp {[\r\n]} $line]} {
        return -code error -errorcode {MINIEGG OUTPUT NEWLINE} "output contains CR/LF"
    }
    lappend output [dict create kind $kind line $line]
}

proc ::putserv {line} { ::miniegg::record putserv $line }
proc ::puthelp {line} { ::miniegg::record puthelp $line }
proc ::putquick {line} { ::miniegg::record putquick $line }

proc ::miniegg::output {} {
    variable output
    return $output
}

::miniegg::reset
