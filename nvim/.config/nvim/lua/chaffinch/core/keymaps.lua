vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<Leader>w", "<Cmd>write<CR>", { desc = "Easier write command" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
