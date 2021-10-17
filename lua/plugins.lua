vim.call('plug#begin', '~/.config/nvim/plugged')

local Plug = vim.fn['plug#']
Plug 'ryanoasis/vim-devicons'
Plug 'hoob3rt/lualine.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'janko-m/vim-test'
--global('test#strategy', 'neovim')
--global('test#neovim#term_position', 'vert botright 100')

Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-colors.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

Plug('dbeniamine/cheat.sh-vim')

Plug 'preservim/nerdtree'

-- Themes
Plug('kaicataldo/material.vim', { branch = 'main' })
Plug 'jacoborus/tender.vim'

Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

vim.call('plug#end')
