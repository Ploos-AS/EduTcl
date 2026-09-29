namespace eval ::miniirc::connection { variable reconnectAttempt 0 }
proc ::miniirc::connection::handle {msg} {
    set cmd [dict get $msg command]; set p [dict get $msg params]
    switch -exact -- $cmd {
        PING {
            if {[llength $p] != 1} {return -code error -errorcode {MINIIRC PROTOCOL PING} "invalid PING"}
            set line [::miniirc::serializer::message PONG {} 1 [lindex $p 0]]
            ::miniirc::outbox::put $line
        }
        001 { if {[llength $p]} {::miniirc::state::online [lindex $p 0]} }
        005 {
            foreach token [lrange $p 1 end-1] { ::miniirc::network::apply $token }
        }
        default { }
    }
    return $cmd
}
proc ::miniirc::connection::backoff {attempt} { expr {min(60000, 1000 * (1 << min($attempt, 6)))} }
