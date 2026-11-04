local fmt = {
  lua = { 'stylua', '--search-parent-directories', '-' },
  go = { 'gofmt' },
  rust = { 'rustfmt' },
  zig = { 'zig', 'fmt', '--stdin' },
  json = { 'jq', '.' },
  yaml = { 'yamlfmt' },
  python = { 'ruff', 'format', '-' },
}

local function apply(out)
  local lines = vim.split(out, '\n', { plain = true })
  if lines[#lines] == '' then
    table.remove(lines)
  end
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

local function run(cmd, input, cwd)
  local opts = { stdin = input }
  if cwd then
    opts.cwd = cwd
  end
  return vim.system(cmd, opts):wait()
end

local function format()
  if vim.bo.buftype ~= '' then
    return
  end

  local view = vim.fn.winsaveview()
  local input = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')

  local spec = fmt[vim.bo.filetype]
  if spec and vim.fn.executable(spec[1]) == 1 then
    local result = run({ spec[1], unpack(spec, 2) }, input)
    if result.code == 0 then
      apply(result.stdout)
    end
  end

  vim.fn.winrestview(view)
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = format,
})

vim.keymap.set({ 'n', 'x' }, '<Leader>F', format, { desc = 'Format buffer' })
