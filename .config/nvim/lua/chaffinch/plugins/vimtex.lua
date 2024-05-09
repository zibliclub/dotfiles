return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_quickfix_ignore_filters = [[
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \]]

    vim.keymap.set("n", "<leader>c", "<Cmd>update<CR><Cmd>VimtexCompileSS<CR>", {})
    vim.keymap.set("n", "<leader>v", "<plug>(vimtex-view)", {})
  end,
}
