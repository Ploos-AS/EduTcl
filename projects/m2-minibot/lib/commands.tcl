package provide minibot::commands 2.0
namespace eval ::minibot::commands {}

proc ::minibot::commands::hello {args} {
    if {[llength $args] == 0} { set who world } else { set who [join $args " "] }
    ::minibot::state::increment
    return "Hello, $who"
}

proc ::minibot::commands::about {args} {
    ::minibot::state::increment
    return "Modular MiniBot — EduTcl M2"
}

proc ::minibot::commands::count {args} {
    ::minibot::state::increment
    return [dict get [::minibot::state::snapshot] count]
}

proc ::minibot::commands::help {args} {
    ::minibot::state::increment
    set lines {}
    foreach name [::minibot::registry::names] {
        lappend lines "$name — [::minibot::registry::description $name]"
    }
    return [join $lines "\n"]
}

proc ::minibot::commands::install {} {
    ::minibot::registry::register hello [list ::minibot::commands::hello] "greet a user"
    ::minibot::registry::register about [list ::minibot::commands::about] "describe MiniBot"
    ::minibot::registry::register count [list ::minibot::commands::count] "show invocation count"
    ::minibot::registry::register help [list ::minibot::commands::help] "list commands"
}
