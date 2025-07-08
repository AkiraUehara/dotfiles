vim.o.confirm = true
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.mouse = 'a'
vim.o.showcmd = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 300
vim.o.updatetime = 250

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

