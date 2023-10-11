set --path -x PATH ~/.cargo/bin:~/.local/bin:$PATH
set -x NEMU_HOME /home/ethan/ics2022/nemu
set -x AM_HOME /home/ethan/ics2022/abstract-machine
set -x NAVY_HOME /home/ethan/ics2022/navy-apps
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
if status is-interactive
    # Commands to run in interactive sessions can go here
end
