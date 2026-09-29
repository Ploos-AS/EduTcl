set here [file dirname [file normalize [info script]]]
foreach f {parser.tcl serializer.tcl network.tcl outbox.tcl state.tcl connection.tcl} { source [file join $here lib $f] }
::miniirc::network::reset
::miniirc::outbox::reset
::miniirc::state::reset
