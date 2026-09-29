namespace eval ::edutcl::admin {}

proc ::edutcl::admin::rehash {nick uhost hand text} {
    # Teaching example only: no real rehash is performed.
    puthelp "PRIVMSG $nick :authorized administrative command received"
    return 0
}

bind msg m rehash ::edutcl::admin::rehash
