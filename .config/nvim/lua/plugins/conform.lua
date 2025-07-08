return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      -- Conform will run multiple formatters sequentially
      lua = { 'stylua' },
      -- NOTE: You can customize some of the format options for the filetype (:help conform.format)
      -- rust = { 'rustfmt', lsp_format = 'fallback' },
      -- NOTE: Conform will run the first available formatter
      -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
    },
  },
}
