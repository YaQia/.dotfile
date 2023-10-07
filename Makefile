is_Arch := $(shell lsb_release -d | grep Arch)
CONFIG_DIR := ~/.config
PWD := $(shell pwd)
OBJS := $(shell find . -maxdepth 1 -type d | grep -v 'applications' | grep -v '.git' | tail -n +2 | sed 's/.\///g')
OBJ_FILES := $(foreach obj_dir,$(OBJS),$(shell find $(obj_dir) -type f))
DESKTOP_APP_FILES := $(shell find ./applications -type f | sed 's/.\/applications\///g')
DESKTOP_FILE_DIR := ~/.local/share/applications
.PHONY: install config
install:
ifeq ($(is_Arch),)
	@echo "Error: This system is not Arch"
else
	@# add archlinuxcn source
	@test -f /etc/pacman.d/cn_mirrorlist || echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' | sudo tee /etc/pacman.d/cn_mirrorlist > /dev/null
	@cat /etc/pacman.conf | grep 'archlinuxcn' > /dev/null || echo -e '[archlinuxcn]\nInclude = /etc/pacman.d/cn_mirrorlist' | sudo tee -a /etc/pacman.conf  > /dev/null
	@# install necessary packages and remove not needed packages
	@sudo pacman -Syu
	@sudo pacman -S archlinuxcn-keyring linux-headers neovim xsel kitty \
		gnome-shell-extensions gnome-tweaks \
		yay fish \
		vlc gthumb v4l2loopback-dkms gst-plugin-pipewire obs-studio \
		ibus ibus-libpinyin \
		cmake clang rustup go ripgrep bear \
		ttf-firacode-nerd noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming
	@sudo pacman -Rcs gnome-music gnome-photos epiphany totem
	@yay -S linuxqq wemeet-bin qt5-wayland wechat-uos v2raya ttf-symbola bibata-cursor-theme adw-gtk3-git 
	@rustup install rust rust-src
endif

config:
	@# setup config files
	echo $(OBJ_FILES)
	@$(foreach obj_file,$(OBJ_FILES),$(shell test -f $(CONFIG_DIR)/$(obj_file) || (mkdir -p "$$(dirname $(CONFIG_DIR)/$(obj_file))" && ln -s $(PWD)/$(obj_file) $(CONFIG_DIR)/$(obj_file))))
	@# setup for applications
	@$(foreach desktop_app_file,$(DESKTOP_APP_FILES),$(shell test -f $(DESKTOP_FILE_DIR)/$(desktop_app_file) || ln -s $(PWD)/applications/$(desktop_app_file) $(DESKTOP_FILE_DIR)/$(desktop_app_file)))
