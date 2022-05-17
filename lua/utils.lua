
function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
  return ...
end

local cmd = vim.cmd

function _G.create_augroup(name, autocommands)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocommands) do
      cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

function _G.map(keymap, command)
  local opt = {silent = true, noremap = false}
  vim.api.nvim_set_keymap('n', keymap, command, opt)
end

function _G.todo_list()
  require'telescope.builtin'.grep_string(require('telescope.themes').get_dropdown({
    search = 'TODO'
  }))
end

function _G.search_on_google(query)
  vim.cmd(string.format("silent !open https://www.google.com/search?q=%s", query))
end

_G.keymaps = {}

function _G.nmap(keymap, command, comment)
  table.insert(_G.keymaps, {keymap, command, comment})
  local opt = {silent = true, noremap = false}
  vim.api.nvim_set_keymap('n', keymap, command, opt)
end

function _G.vmap(keymap, command, comment)
  table.insert(_G.keymaps, {keymap, command, comment})
  local opt = {silent = true, noremap = false}
  vim.api.nvim_set_keymap('v', keymap, command, opt)
end
function _G.open_cheatsheet_with_keymaps()
  require'edelprino.telescope'.cheatsheet(_G.keymaps)
end

function _G.run_telescope_task_runner()
  require'edelprino.telescope'.tasks_runner()
end

function _G.merge(origin, to_merge)
  for k,v in pairs(to_merge) do origin[k] = v end
  return origin
end

function _G.global(key, value)
  local g = vim.g
  g[key] = value
end
