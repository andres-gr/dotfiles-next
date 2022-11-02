local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then return end

local utils = require 'agr.core.utils'
local actions = require 'telescope.actions'

local project = utils.has_plugin 'project_nvim.project'
local cwd = project ~= nil and project.get_project_root() or nil

telescope.setup {
  extensions = {
    fzf = {
      case_mode = 'smart_case', -- or 'ignore_case' or 'respect_case'
      fuzzy = true, -- false will only do exact matching
      override_file_sorter = true, -- override the file sorter
      override_generic_sorter = true, -- override the generic sorter
    },
  },
  defaults = {
    initial_mode = 'normal',
    layout_config = {
      height = 0.80,
      horizontal = {
        preview_width = 0.55,
        prompt_position = 'top',
        results_width = 0.8,
      },
      preview_cutoff = 120,
      vertical = {
        mirror = false,
      },
      width = 0.85,
    },
    layout_strategy = 'horizontal',
    path_display = { 'truncate' },
    prompt_prefix = '  ',
    selection_caret = '❯ ',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,

        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,

        ['<C-c>'] = actions.close,

        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,

        ['<CR>'] = actions.select_default,
        ['<C-x>'] = actions.select_horizontal,
        ['<C-v>'] = actions.select_vertical,
        ['<C-t>'] = actions.select_tab,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,

        ['<PageUp>'] = actions.results_scrolling_up,
        ['<PageDown>'] = actions.results_scrolling_down,

        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<C-l>'] = actions.complete_tag,
        ['<C-h>'] = actions.which_key,
      },
      n = {
        ['<esc>'] = actions.close,
        ['<C-c>'] = actions.close,
        ['<CR>'] = actions.select_default,
        ['<C-x>'] = actions.select_horizontal,
        ['<C-v>'] = actions.select_vertical,
        ['<C-t>'] = actions.select_tab,

        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

        ['j'] = actions.move_selection_next,
        ['k'] = actions.move_selection_previous,
        ['H'] = actions.move_to_top,
        ['M'] = actions.move_to_middle,
        ['L'] = actions.move_to_bottom,

        ['<Down>'] = actions.move_selection_next,
        ['<Up>'] = actions.move_selection_previous,
        ['gg'] = actions.move_to_top,
        ['G'] = actions.move_to_bottom,

        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,

        ['<PageUp>'] = actions.results_scrolling_up,
        ['<PageDown>'] = actions.results_scrolling_down,
        ['<C-b>'] = actions.results_scrolling_up,
        ['<C-f>'] = actions.results_scrolling_down,
        ['<C-h>'] = actions.which_key,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ['<C-d>'] = actions.delete_buffer,
        },
        n = {
          ['dd'] = actions.delete_buffer,
        },
      },
    },
    find_files = {
      cwd = cwd,
      hidden = true,
    },
    grep_string = {
      cwd = cwd,
    },
    live_grep = {
      cwd = cwd,
      initial_mode = 'insert',
      only_sort_text = true,
    },
    oldfiles = {
      only_cwd = true,
    },
  },
}

if utils.has_plugin 'aerial' then
  telescope.load_extension('aerial')
end

if utils.has_plugin 'notify' then
  telescope.load_extension('notify')
end

if utils.has_plugin 'project' then
  telescope.load_extension('projects')
end

