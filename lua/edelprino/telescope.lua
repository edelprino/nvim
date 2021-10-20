local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local action_state = require('telescope.actions.state')

local M = {}

-- TODO Trasformare questo modulo in estensioni telescope

function M.tasks_runner()
  -- TODO Ha senso rendere il comando "make help" configurabile?
  local finder = finders.new_oneshot_job(
    vim.tbl_flatten { "make", "help" }
  )

  pickers.new({}, {
      prompt_title = 'Run project task',
      finder    =  finder,
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function()
        actions.select_default:replace(function(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          -- local choosen_task = string.match(selection.value, "* ([%w-]+):")
          vim.api.nvim_command(string.format("terminal make %s", selection.value))
        end)
        return true
      end
  }):find()
end

function M.nerdtree_aware_live_grep()
    local relative_dir
    local prompt_title

    if vim.fn.exists('b:NERDTree') == 1 then
        local selected_dir = vim.api.nvim_eval('g:NERDTreeDirNode.GetSelected().path.str()')
        local cwd = vim.fn.getcwd()
        relative_dir = selected_dir:gsub(cwd, '.')
        prompt_title = 'Live Grep in ' .. relative_dir
    else
        relative_dir = vim.fn.getcwd()
        prompt_title = 'Live Grep in project'
    end

    require("telescope.builtin").live_grep({
        search_dirs = { relative_dir },
        prompt_title = prompt_title,
    })
end

function M.cheatsheet(keymaps)
  local finder = finders.new_table {
    results = keymaps,
    entry_maker = function(e)
      return {
          value = e[2],
          display = e[1]..'\t\t'..e[3],
          ordinal = e[3],
        }
    end
  }
  pickers.new({}, {
      prompt_title = 'VIM Cheatsheet',
      finder    =  finder,
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function()
          actions.select_default:replace(function(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          vim.api.nvim_exec(selection.value, '')
        end)
        return true
      end
  }):find()
end

M.symfony = function()
  local finder = finders.new_table {
      results = {
          { 'ApiBundle\\Controller\\BankStatementController', 'ApiBundle\\Controller\\BankStatementController' },
          { 'ApiBundle\\Controller\\ContractController', 'ApiBundle\\Controller\\ContractController' },
          { 'ApiBundle\\Controller\\CustomerUpdateIDInfoController', 'ApiBundle\\Controller\\CustomerUpdateIDInfoController' } ,
          { 'ApiBundle\\Controller\\DataController', 'ApiBundle\\Controller\\DataController' },
          { 'ApiBundle\\Controller\\DocumentController', 'ApiBundle\\Controller\\DocumentController' },
      },
      entry_maker = function (e)
          return { value = e[1], display = e[1]..'::'..e[2], ordinal = e[1]}
      end
  }
  pickers.new({}, {
      prompt_title = 'VIM Symfony',
      finder = finder,
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function()
          actions.select_default:replace(function(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              -- print(vim.inspect(selection))
              require'telescope.builtin'.grep_string({
                  search = selection.value,
                  -- vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number',  '--column', '--smart-case', '-g**/*.yml' }
              })
          end)
          return true
      end
  }):find()
end

return M
