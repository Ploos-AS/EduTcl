namespace eval ::edutcl::reply {}

proc ::edutcl::reply::channel {chan text} {
    if {[regexp {[\r\n]} $text]} {
        return -code error -errorcode {EDUTCL REPLY NEWLINE} "reply contains CR/LF"
    }
    puthelp "PRIVMSG $chan :$text"
}

proc ::edutcl::reply::notice {nick text} {
    if {[regexp {[\r\n]} $text]} {
        return -code error -errorcode {EDUTCL REPLY NEWLINE} "reply contains CR/LF"
    }
    puthelp "NOTICE $nick :$text"
}
