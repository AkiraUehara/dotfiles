return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      auto_integrations = true,
      flavour = 'macchiato',
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      no_italic = true,
      no_underline = true,
      integrations = {
        blink_cmp = true,
        gitsigns = {
          enabled = true,
          transparent = true,
        },
        mason = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    })

    vim.cmd.colorscheme('catppuccin')
  end,
}
