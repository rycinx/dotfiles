vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('SetupMisc', { clear = true }),
  once = true,
  callback = function()
    vim.pack.add {
      'https://github.com/nvim-mini/mini.ai',
      'https://github.com/nvim-mini/mini.pairs',
      'https://github.com/nvim-mini/mini.surround',
      'https://github.com/nvim-mini/mini.splitjoin',
      { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
    }
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath 'data' .. '/site',
    }
    require('nvim-treesitter')
      .install({
        'asm',
        'awk',
        'bash',
        'c',
        'make',
        'cpp',
        'css',
        'diff',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'glsl',
        'go',
        'html',
        'json',
        'kdl',
        'llvm',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'ninja',
        'nix',
        'python',
        'query',
        'rust',
        'toml',
        'typst',
        'vim',
        'vimdoc',
        'yaml',
        'zig',
      })
      :wait(300000)
    -- highlight
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- misc
    require('mini.ai').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.splitjoin').setup()
    require('mini.icons').setup()
    require('nvim-web-devicons').setup()
  end,
})
