fish_add_path ~/.cargo/bin ~/.local/bin /usr/share/bcc/tools
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
source ~/.config/fish/private_apis.fish
# set -x http_proxy http://127.0.0.1:7892
# set -x https_proxy http://127.0.0.1:7892
# set -x all_proxy socks5h://127.0.0.1:7891
set -x EDITOR /bin/nvim
#set -x TERMINAL /bin/ghostty
#set -x LANG zh_CN.UTF-8
#set -x LANGUAGE zh_CN:en_US
if status is-interactive
	# source ~/rl-venv/bin/activate.fish
    # Commands to run in interactive sessions can go here
	fish_vi_key_bindings
	fish_config theme choose Tango
end
