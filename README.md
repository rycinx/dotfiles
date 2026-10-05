# Dotfiles

个人 Linux 桌面环境配置文件，主要面向 Wayland（Hyprland + Noctalia）。

## 目录结构

```text
.
├── .bashrc                         # Bash 配置
├── .gitconfig                      # Git 配置
├── .gitignore
├── .config
│   ├── btop
│   │   ├── btop.conf               # btop 配置
│   │   └── themes                  # btop 主题
│   │       ├── caelestia.theme
│   │       └── catppuccin_*.theme
│   ├── fontconfig
│   │   └── fonts.conf               # 字体配置
│   ├── foot
│   │   └── foot.ini                 # foot 终端配置
│   ├── ghostty
│   │   └── config                   # Ghostty 终端配置
│   ├── hypr
│   │   ├── .luarc.json              # Lua LSP 配置
│   │   ├── hyprland.lua             # Hyprland 入口
│   │   ├── appearance.lua           # 外观
│   │   ├── autostart.lua            # 开机自启动
│   │   ├── binds.lua                # 快捷键
│   │   ├── devices.lua              # 输入设备
│   │   ├── env.lua                  # 环境变量
│   │   ├── misc.lua                 # 杂项
│   │   ├── rules.lua                # 窗口规则
│   │   ├── hypridle.conf            # 空闲管理
│   │   ├── hyprlock.conf            # 锁屏
│   │   ├── hyprpaper.conf           # 壁纸
│   │   └── scheme
│   │       └── current.conf         # 当前配色
│   ├── noctalia
│   │   └── config.toml              # Noctalia 桌面配置
│   ├── nvim
│   │   ├── init.lua                 # Neovim 入口
│   │   ├── lazy-lock.json           # 插件版本锁定文件
│   │   ├── lsp                      # LSP 配置
│   │   └── lua
│   │       ├── config               # Neovim 基础配置
│   │       └── plugins              # 插件配置
│   └── yazi
│       ├── yazi.toml                # Yazi 主配置
│       ├── keymap.toml              # 快捷键
│       ├── theme.toml               # 主题
│       ├── package.toml             # 插件依赖
│       └── Catppuccin-Mocha.tmTheme # 语法高亮主题
├── .pi
│   └── agent
│       ├── settings.json            # Pi Agent 主配置（主题、默认模型、插件）
│       ├── open-tui.json            # open-tui 界面配置
│       └── pi-fff.json              # fff 文件搜索配置
└── README.md
```
