local scrollbar_status, scrollbar = pcall(require, 'scrollbar')
if not scrollbar_status then return end

local colors = require 'agr.core.colors'

scrollbar.setup {
  excluded_filetypes = {
    'alpha',
    'neo-tree',
    'TelescopePrompt',
  },
  handle = {
    color = colors.dracula_colors.menu,
  },
  handlers = {
    gitsigns = true,
    search = true,
  },
  marks = {
    Cursor = {
      highlight = 'NeoTreeIndentMarker',
      text = '',
    },
    Search = {
      highlight = 'CmpItemKindConstant',
    },
  },
}
