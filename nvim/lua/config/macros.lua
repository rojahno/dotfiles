local keys = [[yoconsole.log('<Esc>[pa,<Esc>[la, <Esc>[pl')]]
local termkeys = vim.api.nvim_replace_termcodes(keys, true, false, true)
vim.fn.setreg("l", termkeys, "c")
