#!/bin/bash

cur=$(dirname "$(realpath "$0")")
# shellcheck disable=SC1091
source "${cur}/common.sh"

rime_config() {
    # 2. rime 输入法 配置文件
    rt_log "rime installing ......."
    platform=$(rt_select "windows linux")
    rt_log "[${platform}] rime installing ... !"
    case $platform in
        "linux")
            sudo pacman -Syu pi fcitx5-chinese-addons  fcitx5-rime
            install_dir="$HOME/.local/share/fcitx5"
            [ ! -d "${install_dir}" ] && mkdir -p "${install_dir}/themes"
            # rime-ice 配置文件
            git clone git@github.com:iDvel/rime-ice.git "$install_dir"
            # rime-theme 主题文件
            cp -arv "${BIN:-}/home.files/.local/share/fcitx5/themes/*" "${install_dir}"
            ;;
        "windows")
            # windows install
            git clone git@github.com:iDvel/rime-ice.git
            git clone git@gitee.com:linruohan/win10.git
            cp -arvf ./rime-ice/* ~/AppData/Local/fcitx5/rime
            cp -arvf ./win10/soft_config/rime-ice_setting_cover/* ~/AppData/Local/fcitx5/rime
            ;;
    esac
    rt_log "rime cfg installed success !"
}

rime_config "$@"
