vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<Leader>w", "<Cmd>write<CR>", { desc = "Easier write command" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set(
	"i",
	"<C-f>",
	[[<Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]],
	{ desc = "Easier write command" }
)
keymap.set(
	"n",
	"<C-f>",
	[[: silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]],
	{ desc = "Easier write command" }
)
