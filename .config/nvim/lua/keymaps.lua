vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true, silent = true, desc = 'Move Left' })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true, silent = true, desc = 'Move Down' })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true, silent = true, desc = 'Move Up' })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true, desc = 'Move Right' })

vim.keymap.set('n', '<Leader>ff', function()
  Snacks.picker.smart()
end, { desc = 'Find Files' })
vim.keymap.set('n', '<Leader>fo', function()
  Snacks.picker.recent()
end, { desc = 'Find Recent Files' })
vim.keymap.set('n', '<Leader>fw', function()
  Snacks.picker.grep()
end, { desc = 'Find File Content' })
vim.keymap.set('n', '<Leader>fm', function()
  Snacks.picker.marks()
end, { desc = 'Find Marks' })
vim.keymap.set('n', '<Leader>fk', function()
  Snacks.picker.keymaps { layout = 'dropdown' }
end, { desc = 'Find Keymaps' })
vim.keymap.set('n', '<Leader>fh', function()
  Snacks.picker.help { layout = 'dropdown' }
end, { desc = 'Find Help' })
vim.keymap.set('n', '<Leader>fn', function()
  Snacks.picker.notifications { layout = 'dropdown' }
end, { desc = 'Find Notifications' })
vim.keymap.set('n', '<Leader>E', function()
  Snacks.explorer.open()
end, { desc = 'Open Explorer' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open Oil Explorer' })

vim.keymap.set('n', 'gd', function()
  Snacks.picker.lsp_definitions { layout = 'dropdown' }
end, { desc = 'LSP definition' })
vim.keymap.set('n', 'gD', function()
  Snacks.picker.lsp_declarations { layout = 'dropdown' }
end, { desc = 'LSP declaration' })
