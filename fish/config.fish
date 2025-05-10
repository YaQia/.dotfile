fish_add_path ~/.cargo/bin ~/.local/bin /usr/share/bcc/tools
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
# set -x DEEPSEEK_API_KEY '0eP9ifBPr7HkQaQElVcAHphcFALacxiNUYWDqAdbU8kngyQ_B4ueOL2_K-EgtI4m5KfnJH_HWySzGwqrMiaH1w'
# set -x OPENROUTER_API_KEY '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'
set -x OPENROUTER_API_KEY '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'
set -x DEEPSEEK_API_KEY 'sk-93f7b5ed2e1f464cab962748c6c3f973'
set -x http_proxy http://127.0.0.1:7897
set -x https_proxy http://127.0.0.1:7897
set -x all_proxy socks5://127.0.0.1:7897
set -x EDITOR /bin/nvim
#set -x TERMINAL /bin/kitty
#set -x LANG zh_CN.UTF-8
#set -x LANGUAGE zh_CN:en_US
if status is-interactive
    # Commands to run in interactive sessions can go here
end
