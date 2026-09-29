package provide minibot::registry 2.0
namespace eval ::minibot::registry {
    variable entries [dict create]
}

proc ::minibot::registry::reset {} {
    variable entries
    set entries [dict create]
}

proc ::minibot::registry::normalize {name} {
    return [string tolower [string trim $name]]
}

proc ::minibot::registry::register {name callback description} {
    variable entries
    set name [normalize $name]
    if {$name eq ""} {
        return -code error -errorcode {MINIBOT REGISTRY INVALID} "command name must not be empty"
    }
    if {[dict exists $entries $name]} {
        return -code error -errorcode [list MINIBOT REGISTRY DUPLICATE $name] "command already registered: $name"
    }
    if {[catch {llength $callback}] || [llength $callback] == 0} {
        return -code error -errorcode {MINIBOT REGISTRY CALLBACK} "callback must be a non-empty command prefix"
    }
    dict set entries $name [dict create callback $callback description $description]
    return $name
}

proc ::minibot::registry::names {} {
    variable entries
    return [lsort [dict keys $entries]]
}

proc ::minibot::registry::description {name} {
    variable entries
    set name [normalize $name]
    if {![dict exists $entries $name]} {
        return -code error -errorcode [list MINIBOT REGISTRY UNKNOWN $name] "unknown command: $name"
    }
    return [dict get $entries $name description]
}

proc ::minibot::registry::invoke {name args} {
    variable entries
    set name [normalize $name]
    if {![dict exists $entries $name]} {
        return -code error -errorcode [list MINIBOT REGISTRY UNKNOWN $name] "unknown command: $name"
    }
    set callback [dict get $entries $name callback]
    return [{*}$callback {*}$args]
}
