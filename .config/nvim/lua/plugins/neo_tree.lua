return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    { '3rd/image.nvim', opts = {} },
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup({
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter/ignore using buffer options
            bo = {
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              buftype = { 'terminal', 'quickfix' },
            },
          },
        })
      end,
    },
  },
  lazy = false,
  config = function()
    require('neo-tree').setup({
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
      open_files_using_relative_paths = false,
      sort_case_insensitive = false,
      sort_function = nil,
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = '│',
          last_indent_marker = '└',
          highlight = 'NeoTreeIndentMarker',
          with_expanders = nil,
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
      },
      commands = {},
      window = {
        position = 'left',
        width = 32,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['<space>'] = {
            'toggle_node',
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ['<2-LeftMouse>'] = 'open',
          ['<CR>'] = 'open',
          ['<Esc>'] = 'cancel',
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
          ['l'] = 'focus_preview',
          -- ['S'] = 'open_split',
          -- ['s'] = 'open_vsplit',
          ['S'] = 'split_with_window_picker',
          ['s'] = 'vsplit_with_window_picker',
          ['t'] = 'open_tabnew',
          -- ['<cr>'] = 'open_drop',
          -- ['t'] = 'open_tab_drop',
          ['w'] = 'open_with_window_picker',
          ['C'] = 'close_node',
          -- ['C'] = 'close_all_subnodes',
          ['z'] = 'close_all_nodes',
          --['Z'] = 'expand_all_nodes',
          --['Z'] = 'expand_all_subnodes',
          ['a'] = {
            'add',
            -- this command supports BASH style brace expansion ('x{a,b,c}' -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = 'none',
            },
          },
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['b'] = 'rename_basename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy',
          ['m'] = 'move',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
          ['i'] = {
            'show_file_details',
            config = {
              created_format = '%Y-%m-%d %H:%M:%S',
              modified_format = '%Y-%m-%d %H:%M:%S',
            },
          },
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            'node_modules',
          },
          hide_by_pattern = { -- uses glob style patterns
            --'*.meta',
            --'*/src/*/tsconfig.json',
          },
          always_show = {},
          always_show_by_pattern = {},
          never_show = {
            '.DS_Store',
            '.git',
          },
          never_show_by_pattern = {},
        },
        follow_current_file = {
          enabled = false,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = false,
        window = {
          mappings = {
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['H'] = 'toggle_hidden',
            ['/'] = 'fuzzy_finder',
            ['D'] = 'fuzzy_finder_directory',
            ['#'] = 'fuzzy_sorter',
            -- ['D'] = 'fuzzy_sorter_directory',
            ['f'] = 'filter_on_submit',
            ['<c-x>'] = 'clear_filter',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
            ['o'] = {
              'show_help',
              nowait = false,
              config = { title = 'Order by', prefix_key = 'o' },
            },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['og'] = { 'order_by_git_status', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
            -- ['<key>'] = function(state) ... end,
          },
          fuzzy_finder_mappings = {
            ['<down>'] = 'move_cursor_down',
            ['<C-n>'] = 'move_cursor_down',
            ['<up>'] = 'move_cursor_up',
            ['<C-p>'] = 'move_cursor_up',
            ['<esc>'] = 'close',
            -- ['<key>'] = function(state, scroll_padding) ... end,
          },
        },
        commands = {}, -- Add a custom command or override a global one using the same function name
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        show_unloaded = true,
        window = {
          mappings = {
            ['d'] = 'buffer_delete',
            ['bd'] = 'buffer_delete',
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['o'] = {
              'show_help',
              nowait = false,
              config = { title = 'Order by', prefix_key = 'o' },
            },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
      git_status = {
        window = {
          position = 'float',
          mappings = {
            ['A'] = 'git_add_all',
            ['gu'] = 'git_unstage_file',
            ['gU'] = 'git_undo_last_commit',
            ['ga'] = 'git_add_file',
            ['gr'] = 'git_revert_file',
            ['gc'] = 'git_commit',
            ['gp'] = 'git_push',
            ['gg'] = 'git_commit_and_push',
            ['o'] = {
              'show_help',
              nowait = false,
              config = { title = 'Order by', prefix_key = 'o' },
            },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
    })

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal<CR>', { desc = 'Reveal file [e]xplorer' })
  end,
}
