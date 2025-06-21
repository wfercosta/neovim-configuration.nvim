--[[
====================================================================
== Plugin manager installation: lazy.vim
== See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
====================================================================
--]]

-- Obtain the SO path for data and concatenates with the the directory where is placed the plugin
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
print(lazypath)

-- vim.loop was a module in deprecation and the new one is the vim.uv
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local repo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n'.. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

return require('lazy')

