set here [file dirname [file normalize [info script]]]
set tests [glob -nocomplain -directory $here *.test]

if {[llength $tests] == 0} {
    puts stderr "No tests found"
    exit 1
}

set failed 0
foreach testfile [lsort $tests] {
    puts "==> [file tail $testfile]"
    if {[catch {exec [info nameofexecutable] $testfile 2>@1} output]} {
        puts $output
        set failed 1
    } else {
        puts $output
        if {[regexp {Failed\s+([1-9][0-9]*)} $output]} {
            set failed 1
        }
    }
}

exit $failed
