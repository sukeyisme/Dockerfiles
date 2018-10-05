#!/usr/bin/expect

set user [lindex $argv 0]
set pwd [lindex $argv 1]


spawn PgyVistor
expect "Please Enter Your Account:"
send "$user\r"
expect "Please Enter Your Password:"
send "$pwd\r"
expect "Auto Login"
send "n\r"
expect "Login Successful"
interact
