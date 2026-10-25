vim.pack.add {
  'https://github.com/folke/snacks.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/catppuccin/nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-mini/mini.icons',
}
-- snacks
local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]
require('snacks').setup {
  dashboard = {
    enabled = true,
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
    },
    preset = {
      header = logo,
      keys = {
        { icon = ' ', key = 'f', desc = 'Find File', action = ':lua Snacks.picker.smart()' },
        { icon = ' ', key = 'o', desc = 'Recent Files', action = ':lua Snacks.picker.recent()' },
        { icon = ' ', key = 'n', desc = 'New File', action = ':enew' },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
    },
  },
  explorer = {},
  picker = {
    sources = {
      explorer = {
        win = {
          list = {
            keys = {},
          },
        },
        layout = {
          layout = {
            width = 30,
          },
        },
      },
    },
  },
  notifier = { enabled = true },
  image = { doc = { enabled = false } },
}

-- Oil Explorer
require('oil').setup {
  columns = { 'icon' },
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_change = true,
  },
  keymaps = {
    ['L'] = { 'actions.select', mode = 'n' },
    ['H'] = { 'actions.parent', mode = 'n' },
    ['q'] = { 'actions.close', mode = 'n' },
    ['<C-r>'] = { 'actions.refresh', mode = 'n' },
    ['<C-y>'] = { 'actions.yank_entry', mode = 'n' },
    ['\\'] = { 'actions.select', opts = { horizontal = true } },
    ['|'] = { 'actions.select', opts = { vertical = true } },
  },
}
-- Catppuccin Theme
require('catppuccin').setup {
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  transparent_background = true,
  float = {
    transparent = true,
  },
}
vim.cmd.colorscheme 'catppuccin'

-- Statusline
require('lualine').setup()

-- Lsp Progress bar
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd('LspProgress', {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= 'table' then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ('[%3d%%] %s%s'):format(
            value.kind == 'end' and 100 or value.percentage or 100,
            value.title or '',
            value.message and (' **%s**'):format(value.message) or ''
          ),
          done = value.kind == 'end',
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(table.concat(msg, '\n'), vim.log.levels.INFO, {
      id = 'lsp_progress',
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- Highlight Copy Text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'highlight copying text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { timeout = 150 }
  end,
})
