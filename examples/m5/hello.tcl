namespace eval ::edutcl::hello {}

proc ::edutcl::hello::command {nick uhost hand chan text} {
    set who $nick
    if {$who eq ""} { set who "there" }
    putserv "PRIVMSG $chan :Hello, $who!"
    return 0
}

bind pub - !hello ::edutcl::hello::command
