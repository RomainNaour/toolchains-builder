#!/usr/bin/expect
#

set timeout 180

log_file /tmp/expect_session.log
eval spawn $env(QEMU_COMMAND)

expect {
    eof {puts "Connection problem, exiting."; exit 1}
    timeout {puts "System did not boot in time, exiting."; exit 1}
    "buildroot login:"
}
send "root\r"
expect {
    eof {puts "Connection problem, exiting."; exit 1}
    timeout {puts "No shell, exiting."; exit 1}
    "# "
}
send "poweroff\r"
expect "System halted"



