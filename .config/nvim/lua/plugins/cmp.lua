vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
  group = vim.api.nvim_create_augroup('SetupCompletion', { clear = true }),
  once = true,
  callback = function()
    vim.pack.add {
      -- completion
      'https://github.com/rafamadriz/friendly-snippets',
      { src = 'https://github.com/Saghen/blink.cmp', version = 'v1.10.2' },
    }

    require('blink.cmp').setup {
      keymap = { preset = 'super-tab' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = true },
        menu = {
          border = 'none',
          draw = {
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind' },
              { 'source_name' },
            },
          },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    }
  end,
})
