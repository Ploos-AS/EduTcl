namespace eval ::edutcl::noteboard {
    variable notes {}
    variable limit 8
    variable initialized 0
}

proc ::edutcl::noteboard::reply {chan text} {
    if {[regexp {[\r\n]} $text]} {
        return -code error -errorcode {EDUTCL NOTEBOARD NEWLINE} "reply contains CR/LF"
    }
    puthelp "PRIVMSG $chan :$text"
}

proc ::edutcl::noteboard::add {hand text} {
    variable notes; variable limit
    set text [string trim $text]
    if {$text eq ""} { return -code error -errorcode {EDUTCL NOTEBOARD EMPTY} "empty note" }
    if {[string length $text] > 160} { return -code error -errorcode {EDUTCL NOTEBOARD LONG} "note too long" }
    if {[llength $notes] >= $limit} { return -code error -errorcode {EDUTCL NOTEBOARD FULL} "note board is full" }
    lappend notes [dict create hand $hand text $text]
    return [llength $notes]
}

proc ::edutcl::noteboard::command {nick uhost hand chan text} {
    set words [split [string trim $text]]
    set sub [string tolower [lindex $words 0]]
    switch -exact -- $sub {
        add {
            set body [join [lrange $words 1 end] " "]
            if {[catch {set n [add $hand $body]} err]} { reply $chan "note: $err"; return 0 }
            reply $chan "note added (#$n)"
        }
        list {
            variable notes
            if {![llength $notes]} { reply $chan "no notes"; return 0 }
            set i 0
            foreach note $notes {
                incr i
                reply $chan "#$i: [dict get $note text]"
            }
        }
        default { reply $chan "usage: !note add <text> | !note list" }
    }
    return 0
}

proc ::edutcl::noteboard::clear {nick uhost hand chan text} {
    variable notes
    set notes {}
    reply $chan "notes cleared"
    return 0
}

proc ::edutcl::noteboard::init {} {
    variable initialized
    if {$initialized} { return }
    bind pub - !note ::edutcl::noteboard::command
    bind pub m !noteclear ::edutcl::noteboard::clear
    set initialized 1
}

proc ::edutcl::noteboard::shutdown {} {
    variable notes; variable initialized
    set notes {}
    set initialized 0
}

::edutcl::noteboard::init
