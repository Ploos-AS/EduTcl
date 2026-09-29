namespace eval ::edutcl::status {}

proc ::edutcl::status::command {nick uhost hand text} {
    puthelp "PRIVMSG $nick :status: running"
    return 0
}

bind msg - status ::edutcl::status::command
