proc require_positive {value} {
    if {![string is integer -strict $value] || $value <= 0} {
        return -code error -errorcode {EDUTCL ARG POSITIVE} "expected a positive integer"
    }
    return $value
}

try {
    require_positive nope
} trap {EDUTCL ARG} {message options} {
    puts "argument error: $message"
    puts "code: [dict get $options -errorcode]"
}
