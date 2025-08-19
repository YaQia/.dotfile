fish_add_path ~/.cargo/bin ~/.local/bin /usr/share/bcc/tools
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
# set -x DEEPSEEK_API_KEY '0eP9ifBPr7HkQaQElVcAHphcFALacxiNUYWDqAdbU8kngyQ_B4ueOL2_K-EgtI4m5KfnJH_HWySzGwqrMiaH1w'
# set -x OPENROUTER_API_KEY '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'
source ~/.config/fish/private_apis.fish
# set -x http_proxy http://127.0.0.1:7892
# set -x https_proxy http://127.0.0.1:7892
set -x all_proxy socks5h://127.0.0.1:7891
set -x EDITOR /bin/nvim
set -gx HSA_OVERRIDE_GFX_VERSION 11.0.0
set -gx ROCM_PATH /opt/rocm
#set -x TERMINAL /bin/kitty
#set -x LANG zh_CN.UTF-8
#set -x LANGUAGE zh_CN:en_US
if status is-interactive
	# source ~/rl-venv/bin/activate.fish
    # Commands to run in interactive sessions can go here
end
