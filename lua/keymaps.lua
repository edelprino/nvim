-- LEADER
vim.g.mapleader = ' '
nmap('<leader> ', ':w<cr>', 'Save a file')
nmap('<C-H>', '<cmd>lua open_cheatsheet_with_keymaps()<CR>', 'Show cheatsheet')

nmap('<C-J>', ':bprevious<CR>', 'Previous buffer')
nmap('<C-K>', ':bnext<CR>', 'Next buffer')
nmap('<C-Q>', ':q<cr>', 'Close window') -- as in google chrome, keep consistency?
nmap('<CR>', '<C-W><C-W>', 'Switch between all split windows')
nmap('<BS>', ':b#<cr>', 'Alternate file')
nmap('<leader>sv', ':vsplit<cr>', 'Vertical split')
nmap('<leader>sh', ':split<cr>', 'Horizontal split')

nmap('<leader>t', ':TestNearest<cr>', 'Run test')
nmap('<leader>tt', ':TestLast<cr>', 'Run last test runned')

nmap('<leader>e',  ':NERDTreeToggle %<CR>', 'File explorer')
nmap('<leader>c', ':Commentary<CR>','Toggle comments into the code')

nmap('<leader>k',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Show signature help')

-- Move between files
nmap('<C-F>', ':Telescope find_files<cr>', 'Find a file by name in all project')
vmap('<C-F>', "\"gy :lua require'telescope.builtin'.grep_string({search=vim.fn.getreg('g')})<cr>", 'Find a file by name from selected text in all project')
nmap('<C-G>', ':Telescope live_grep<cr>', 'Fuzzy search in all files in the project')
nmap('<C-B>', '<cmd>Telescope buffers<cr>', 'Fuzzyfinder on open buffers')

nmap('<leader>i', '<cmd>Telescope lsp_implementations<cr>', 'Find all implementations')
nmap('<leader>r', '<cmd>Telescope lsp_references<cr>', 'Class references')
nmap('<leader>d', '<cmd>Telescope lsp_definitions<cr>', 'Class definition')

-- Refactor action
nmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename variable')
nmap('<leader>a', ':Telescope lsp_code_actions<cr>', 'FuzzyFinder on contextual code actions')

-- git actions
nmap('<leader>g', ':Git<cr>', 'Git open Fugitive')
nmap('<leader>gb', ':Telescope git_branches theme=dropdown<cr>', 'Git branches')
nmap('<leader>gr', ':Telescope gh run<cr>', 'Github Actions')
nmap('<leader>gps', ':Git push<cr>', 'Git push')
nmap('<leader>gpl', ':Git pull<cr>', 'Git pull')
nmap('<leader>gpr', ':Telescope gh pull_request<cr>', 'Github Pull Request')

nmap('<leader>p', ":execute 'Cheat '.&filetype.' '.input('Cosa vuoi cercare? ')<cr>", 'Open cheat query')
nmap('<leader>f', ":silent exec 'https://www.google.com/search?q=probdafsdfasf'<cr>", 'Search on google')

-- Lower Row
map('<leader>v', ':terminal<cr>')
nmap('<leader>w', '<cmd>lua run_telescope_task_runner()<cr>', 'Task runner')
nmap('<leader>td', '<cmd>lua todo_list()<cr>', 'Project TODO List')
