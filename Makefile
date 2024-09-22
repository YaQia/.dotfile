is_Arch := $(shell lsb_release -d | grep Arch)
CONFIG_DIR := ~/.config
PWD := $(shell pwd)
OBJS := $(shell find . -maxdepth 1 -type d | grep -v 'applications' | grep -v '.git' | tail -n +2 | sed 's/.\///g')
OBJ_FILES := $(foreach obj_dir,$(OBJS),$(shell find $(obj_dir) -type f))
DESKTOP_APP_FILES := $(shell find ./applications -type f | sed 's/.\/applications\///g')
DESKTOP_FILE_DIR := ~/.local/share/applications
.PHONY: install config
install:
	@# add archlinuxcn source
	@#test -f /etc/pacman.d/cn_mirrorlist || echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' | sudo tee /etc/pacman.d/cn_mirrorlist > /dev/null
	@#cat /etc/pacman.conf | grep 'archlinuxcn' > /dev/null || echo -e '[archlinuxcn]\nInclude = /etc/pacman.d/cn_mirrorlist' | sudo tee -a /etc/pacman.conf  > /dev/null
	@# install necessary packages and remove not needed packages
	@sudo pacman -Syu
	@sudo pacman -S neovim xsel kitty \
		gnome-shell-extensions gnome-tweaks \
		yay fish \
		vlc gthumb gst-plugin-pipewire obs-stuVue volardio \
		ibus ibus-rime \
		cmake clang rust go ripgrep bear \
		ttf-firacode-nerd noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming
	@sudo pacman -Rcs gnome-music epiphany totem
	@yay -Syu linuxqq wemeet-bin wechat-uos v2raya ttf-symbola bibata-cursor-theme adw-gtk3-git 
	@# needed LSP support for nvim
	@sudo pacman -Syu rust-analyzer gopls bash-language-server lua-language-server yaml-language-server pyright vscode-html-languageserver vscode-css-languageserver marksman texlab typescript-language-server eslint eslint-language-server vscode-json-languageserver vue-language-server cmake-language-server stylua
	@yay -Syu cssmodules-language-server dockerfile-language-server golangci-lint-langserver-bin nodejs-compose-language-service
	@#rustup install rust rust-src

config:
	@# setup config files
	@# echo $(OBJ_FILES)
	@$(foreach obj_file,$(OBJ_FILES),$(shell test -f $(CONFIG_DIR)/$(obj_file) || (mkdir -p "$$(dirname $(CONFIG_DIR)/$(obj_file))" && ln -s $(PWD)/$(obj_file) $(CONFIG_DIR)/$(obj_file))))
	@# setup for applications
	@$(foreach desktop_app_file,$(DESKTOP_APP_FILES),$(shell test -f $(DESKTOP_FILE_DIR)/$(desktop_app_file) || ln -s $(PWD)/applications/$(desktop_app_file) $(DESKTOP_FILE_DIR)/$(desktop_app_file)))
