local o = vim.opt
o.compatible = false
o.smartindent = true
o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.title = true
o.visualbell = true
o.termguicolors = true
o.laststatus = 2
o.encoding = 'utf-8'
o.backup = false
o.swapfile = false
o.writebackup = false
o.autowrite = true
o.autowriteall = true
o.background = 'dark'
vim.wo.number = true
o.shell = '/bin/zsh'
o.wildmenu = true
o.mouse = 'a'
o.splitbelow = true
-- Add local vimrc
o.exrc = true
o.secure = true

require('utils')
require('plugins')
require('keymaps')
require('lsp')

require('lualine').setup {
  options = {
     theme = "powerline"
  }
}

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
         ["<esc>"] = actions.close,
         ["<C-K>"] = actions.move_selection_previous,
         ["<C-J>"] = actions.move_selection_next,
      }
    }
  },
  pickers = {
  },
}

require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}


local cmp = require'cmp'
cmp.setup{
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
  },
}

require 'lspsaga'.init_lsp_saga()

