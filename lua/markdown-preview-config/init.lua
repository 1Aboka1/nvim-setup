vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.cmd(
[[
function OpenMarkdownPreview (url)
  execute "silent ! firefox --new-window " . a:url
endfunction
]]
)
vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
vim.keymap.set('n', '<leader>mm', '<cmd>MarkdownPreview<cr>', {desc = 'Open markdown'})
vim.keymap.set('n', '<C-h>', '<mark style="background-color:red; color:white; border-radius: 10px; padding: 3px; font-weight: 600;"></mark>')
