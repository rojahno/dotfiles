-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Paste without yanking the replaced text (allows multiple pastes)
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without yanking" })

-- Resize window using <ctrl> hjkl keys
vim.keymap.set("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
