package provide minibot 2.0

namespace eval ::minibot {}

proc ::minibot::initialize {} {
    ::minibot::state::reset
    ::minibot::registry::reset
    ::minibot::commands::install
}

proc ::minibot::dispatch {name args} {
    return [::minibot::registry::invoke $name {*}$args]
}
