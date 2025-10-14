require('core.lazy.bootstrap')

require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  install = {
    colorscheme = { 'catppuccin' },
  },
  checker = {
    enabled = true,
  },
  ui = {
    border = 'rounded',
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
