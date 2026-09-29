set here [file dirname [file normalize [info script]]]
foreach module {config state registry commands minibot} {
    source [file join $here lib "$module.tcl"]
}

::minibot::initialize
set config [::minibot::config::make]

while {[gets stdin line] >= 0} {
    set line [string trim $line]
    if {$line eq ""} continue
    set words [split $line]
    set command [lindex $words 0]
    set args [lrange $words 1 end]
    if {[string equal -nocase $command quit]} {
        puts "bye"
        break
    }
    try {
        puts [::minibot::dispatch $command {*}$args]
    } trap {MINIBOT REGISTRY UNKNOWN} {message options} {
        puts "error: $message"
    } on error {message options} {
        puts stderr "internal error: $message"
    }
}
