#!/usr/bin/expect

set test1 "FAILED" 
set test2 "FAILED"
set output3 "FAILED"
set output4 "FAILED"
set output5 "FAILED"
set view "FAILED"
set remove "FAILED"
set serach "FAILED"

spawn "./a.out"

expect -nocase "enter" {send "1\n"}
expect -nocase "enter" {send "Immogen Poots\n" }
expect -nocase "enter" {send "987654321\n"}
expect -nocase "enter" {send "poots@imdb.com\n"}

expect -nocase "enter" {send "2\n"}
set test1 "SUCESS"

expect -nocase "enter" {send "1\n"}
expect -nocase "enter" {send "Jennifer Lopez\n"}
expect -nocase "enter" {send "123456789\n"}
expect -nocase "enter" {send "poots@imdb.com\n"}

expect -nocase "enter" { send "2\n"}
set test2 "SUCESS"

expect -nocase "enter" {send "7\n"}
expect -re "(:)(| )(5)" { set output3 "SUCESS"}

expect -nocase "enter" {send "8\n"}
expect -re "(:)(| )(3)" { set output4 "SUCESS"}

expect -nocase "enter" {send "5\n"}
expect -nocase "poots@imdb.com" { set view "SUCESS"}

expect -nocase "enter" {send  "3\n"}
expect -nocase "enter" {send "123456789\n"}

expect -nocase "enter" {send "8\n"}
expect -re "(:)(| )(4)" { set remove "SUCESS"}

expect -nocase "enter" {send "4\n"}
expect -nocase "enter" {send "987654321\n"}
expect -nocase "Immogen Poots" {set search "SUCESS"}

puts "\n\n\n\n\--------------------------------------------"
puts "  Test                    Result"
puts "--------------------------------------------"
puts "\n Add Node Test 1   -  $test1"
puts "\n Add Node Test 2   -  $test2"
puts "\n STDOUT Print Test -  $view"
puts "\n Availablity  Test -  $output3"
puts "\n List Node(s) Test -  $output4"
puts "\n Node Removal Test -  $remove"
puts "\n Search Node Test  -  $search"
puts "--------------------------------------------\n\n"
