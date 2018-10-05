#!/usr/bin/expect

set user 22264820:003
set pwd 123456


spawn PgyVistor
expect "Please Enter Your Account:"
send "$user\r"
expect "Please Enter Your Password:"
send "$pwd\r"
expect "Auto Login"
send "n\r"
expect "Login Successful"
interact
