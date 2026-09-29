set path [file join [pwd] "edutcl-utf8-demo.txt"]
set f [open $path w]
try {
    fconfigure $f -encoding utf-8 -translation lf
    puts $f "Blåbær — Tcl"
} finally {
    close $f
}

set f [open $path r]
try {
    fconfigure $f -encoding utf-8 -translation auto
    puts [read $f]
} finally {
    close $f
}

file delete $path
