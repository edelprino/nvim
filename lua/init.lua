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

vim.g['test#strategy'] = 'neovim'
vim.g['test#neovim#term_position'] = 'vert botright 100'

require('lualine').setup {
  options = {
     theme = "powerline"
  }
}

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    color_devicons = true,
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

-- TODO: lsp config for cmp integration
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }
local cmp = require'cmp'
cmp.setup{
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'vsnip' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
  },
}

require("bufferline").setup{}
