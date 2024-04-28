vim.opt.spelllang = 'ru'

vim.b.SPELL_ENGLISH = false

function ToggleEnglishSpell()
  if vim.b.SPELL_ENGLISH then  -- if English spelling is on, turn it off
    vim.opt.spelllang:append('ru')
    vim.opt.spelllang:remove('en')
    vim.b.SPELL_ENGLISH = false
  else -- if English spelling is off, turn it on
    vim.opt.spelllang:append('en')
    vim.opt.spelllang:remove('ru')
    vim.b.SPELL_ENGLISH = true
  end
end

vim.keymap.set('n', '<Leader>zz', '<Cmd>set spell!<CR>')
vim.keymap.set('n', '<Leader>ze', ToggleEnglishSpell)
