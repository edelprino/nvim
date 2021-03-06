vim.call('plug#begin', '~/.config/nvim/plugged')

local Plug = vim.fn['plug#']
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'janko-m/vim-test'

Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-colors.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

Plug 'github/copilot.vim'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'dbeniamine/cheat.sh-vim'

Plug 'preservim/nerdtree'

-- Themes
Plug('kaicataldo/material.vim', { branch = 'main' })
Plug 'jacoborus/tender.vim'

Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug('phpactor/phpactor', {['for']= 'php', ['tag'] = '*', ['do'] = 'composer install --no-dev -o'})

Plug 'vmchale/dhall-vim'

vim.call('plug#end')
