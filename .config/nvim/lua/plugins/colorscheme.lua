return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'macchiato',
      transparent_background = true,
      no_italic = true,
      no_underline = true,
      integrations = {
        gitsigns = {
          enabled = true,
          transparent = true,
        },
        mason = false,
        which_key = true,
      },
    })

    vim.cmd.colorscheme('catppuccin')
  end,
}

