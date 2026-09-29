set users [list Alice "Bob Smith" {$literal} {[not-a-command]}]
puts "Count: [llength $users]"

foreach user $users {
    puts "User: $user"
}

lappend users Carol
puts "Sorted: [lsort $users]"
