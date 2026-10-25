## 目录结构

```text
├── .bashrc                           # Bash 配置（提示符、别名、环境变量、flyline/fzf/zoxide/mise）
├── .gitconfig                        # Git 配置（delta、别名）
├── .gitignore
├── .config
│   ├── btop
│   │   ├── btop.conf                 # btop 配置（catppuccin_mocha）
│   │   └── themes
│   │       ├── caelestia.theme
│   │       └── catppuccin_*.theme    # Catppuccin 四种配色
│   ├── fontconfig
│   │   └── fonts.conf                # 字体回退与渲染配置
│   ├── foot
│   │   └── foot.ini                  # foot 终端配置（Catppuccin、透明度 0.7）
│   ├── ghostty
│   │   └── config                    # Ghostty 终端配置（含 Alt+` 快速终端）
│   ├── hypr                          # Hyprland（Lua 配置）
│   │   ├── .luarc.json               # Lua LSP 配置（hl 全局、hypr stubs）
│   │   ├── hyprland.lua              # 入口，按序 require 各模块
│   │   ├── appearance.lua            # 外观（间距、边框、圆角、阴影、模糊、scrolling 布局）
│   │   ├── autostart.lua             # 开机自启动
│   │   ├── binds.lua                 # 快捷键（主修饰键 Alt）
│   │   ├── devices.lua               # 输入设备与显示器
│   │   ├── env.lua                   # 环境变量（fcitx5、locale、光标）
│   │   ├── misc.lua                  # 杂项
│   │   ├── rules.lua                 # 窗口/图层规则
│   │   ├── hypridle.conf             # 空闲管理（5 分钟锁屏、10 分钟休眠）
│   │   ├── hyprlock.conf             # 锁屏
│   │   ├── hyprpaper.conf            # 壁纸
│   │   └── scheme
│   │       └── current.conf          # 当前配色
│   ├── nvim                          # Neovim（vim.pack 管理插件）
│   │   ├── init.lua                  # 入口，加载 options/keymaps/fmt/plugins
│   │   ├── .stylua.toml              # Lua 格式化配置
│   │   └── lua
│   │       ├── options.lua           # 编辑器选项
│   │       ├── keymaps.lua           # 快捷键（leader 为空格）
│   │       ├── fmt.lua               # 保存时按文件类型格式化
│   │       └── plugins
│   │           ├── init.lua          # 插件列表入口
│   │           ├── cmp.lua           # blink.cmp 补全
│   │           ├── lsp.lua           # mason + lspconfig，按需启用 LSP
│   │           ├── misc.lua          # treesitter、mini.* 系列
│   │           └── ui.lua            # snacks、oil、catppuccin、lualine
│   └── yazi
│       ├── yazi.toml                 # Yazi 主配置（$EDITOR 打开、显示软链接）
│       ├── keymap.toml               # 快捷键（M 挂载）
│       ├── theme.toml                # 主题
│       ├── package.toml              # 插件依赖（mount）
│       └── Catppuccin-Mocha.tmTheme  # 语法高亮主题
├── .pi
│   └── agent
│       ├── AGENTS.md                 # Pi Agent 全局指令
│       ├── settings.json             # Pi Agent 主配置（主题、默认模型、插件）
│       ├── open-tui.json             # open-tui 界面配置
│       └── pi-fff.json               # fff 文件搜索配置
└── README.md
```
