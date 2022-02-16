
local lsp = require('lspconfig')

-- lsp.intelephense.setup{
--     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     settings = {
--         intelephense = {
--             -- debug = {enable = true},
--             environment = {phpVersion = "7.1"},
--             stubs = {
--               "bcmath", "bz2", "calendar", "Core", "curl", "date", "dba", "dom", "enchant", "fileinfo", "filter", "ftp", "gd", "gettext", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "mcrypt", "mysql", "mysqli", "mongo", "mongodb", "password", "pcntl", "pcre", "PDO", "pdo_mysql", "Phar", "readline", "recode", "Reflection", "regex", "session", "SimpleXML", "soap", "sockets", "sodium", "SPL", "standard", "superglobals", "sysvsem", "sysvshm", "tokenizer", "xml", "xdebug", "xmlreader", "xmlwriter", "yaml", "zip", "zlib", "wordpress", "woocommerce", "acf-pro", "wordpress-globals", "wp-cli", "genesis", "polylang",
--             },
--             files = {
--                 maxSize = 5000000
--             }
--         },
--     },
-- }
--

-- lsp.psalm.setup {
--   capabilities = capabilities,
--   cmd = {"./backend/bin/psalm.phar", "--language-server", "-r", "./backend"},
--   root_dir = function()
--     return vim.fn.getcwd() .. "/backend"
--   end
-- }


vim.lsp.set_log_level("debug")

-- local function hls_container(root_dir)
--   local workdir = root_dir or vim.fn.getcwd()
--   local root_stack_volume = "/Users/edelprino/.cache/haskell-lsp-stack/:/root/.stack/"
--   local volume =  workdir..":"..workdir..":ro"
--   return {
--     "docker",
--     "run",
--     "--rm",
--     "-i",
--     "--volume="..volume,
--     "--volume="..root_stack_volume,
--     "--workdir="..workdir,
--     "haskell-docker-lsp",
--     "--lsp"
--   }
-- end

-- lsp.hls.setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   -- cmd= { './bin/lsp', '--lsp' },
--   cmd= hls_container(),
-- }

lsp.gopls.setup {}
--- TODO: tsserver

local username = vim.fn.expand('$USER')

local sumneko_root_path = "/Users/" .. username .. "/.config/nvim/lua-language-server"
local sumneko_binary = "/Users/" .. username .. "/.config/nvim/lua-language-server/bin/macOs/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}
