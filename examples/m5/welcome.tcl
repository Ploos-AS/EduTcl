namespace eval ::edutcl::welcome {}

proc ::edutcl::welcome::join {nick uhost hand chan} {
    puthelp "NOTICE $nick :Welcome to $chan"
    return 0
}

bind join - * ::edutcl::welcome::join
