vim.pack.add {
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
}

require('mason').setup()
--=============================================================================
-- LSP — lspconfig
--=============================================================================
local lsp_list = {
  'lua_ls',
  'pyrefly',
  'tinymist',
  'zls',
}

for _, lsp in ipairs(lsp_list) do
  vim.lsp.enable(lsp)
end

--=============================================================================
-- LSP UX
--=============================================================================
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
  end,
})

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '●',
      [vim.diagnostic.severity.WARN] = '●',
      [vim.diagnostic.severity.INFO] = '●',
      [vim.diagnostic.severity.HINT] = '●',
    },
  },
  underline = false,
  virtual_text = true,
  update_in_insert = false,
  severity_sort = true,
}
