-- Atajos de Minty
vim.keymap.set("n", "<leader>cx", "<cmd>Shades<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ch", "<cmd>Huefy<CR>", { noremap = true, silent = true })
-- Eliminar atajo por defecto de Lazyvim
vim.defer_fn(function()
  local success_n = pcall(vim.keymap.del, "n", "<leader>K", { noremap = true, silent = true })
  local success_v = pcall(vim.keymap.del, "v", "<leader>K", { silent = true })
end, 100) -- Retraso de 100ms para asegurar la carga completa

vim.keymap.set("n", "<leader>tn", "<cmd>Telescope registers<CR>", { noremap = true, silent = true })
