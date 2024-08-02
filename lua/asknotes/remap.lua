vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<Leader>l', ':ls<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>p', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>d', ':bd<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<f5>', ':make | copen | bd<CR>', { noremap = true, silent = true })


function _G.make_with_filename()
	local modified = vim.api.nvim_buf_get_option(0, 'modified')
	local filename = vim.fn.expand('%:t:r')
	if modified then vim.cmd('w'); end
	vim.cmd('make ' .. filename)
	vim.cmd('copen')
	--vim.cmd('! ./' .. filename)
	vim.cmd('bd')
end

function _G.make_run_with_filename()
	local modified = vim.api.nvim_buf_get_option(0, 'modified')
	local filename = vim.fn.expand('%:t:r')
	if modified then vim.cmd('w'); end
	vim.cmd('make run_' .. filename)
	vim.cmd('copen')
	--vim.cmd('! ./' .. filename)
	vim.cmd('bd')
end

vim.api.nvim_set_keymap('n', '<f6>', ':lua make_with_filename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<f7>', ':lua make_run_with_filename()<CR>', { noremap = true, silent = true })

-- Function to show diagnostics with custom options
function _G.show_diagnostics()
  vim.diagnostic.open_float(nil, {
    scope = "line",
    border = "rounded",
    focusable = false
  })
end

-- Key mapping to show diagnostics in a floating window for the current line
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua show_diagnostics()<CR>', { noremap = true, silent = true })

-- Key mapping to show diagnostics in a floating window for the current cursor position
vim.api.nvim_set_keymap('n', '<leader>E', '<cmd>lua vim.diagnostic.open_float({scope="cursor", border="rounded", focusable=false})<CR>', { noremap = true, silent = true })

