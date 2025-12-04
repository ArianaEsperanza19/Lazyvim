-- INFO: Dict.nvim is a plugin that provides a dictionary for Neovim. It allows you to look up words in a dictionary
-- and get their definitions, synonyms, antonyms, and more.
-- It's necessary have installed Telescope and at least one diccionary.
-- You may install them by: sudo apt install dict dictd dict-wn dict-gcide dict-freedict-por-eng
-- PENDIENTE
return {
  {
    "jalvesaq/dict.nvim", -- Plugin principal de dict.nvim
    keys = { "<leader>d" },
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Dependencia de Telescope
      "nvim-lua/plenary.nvim", -- Dependencia requerida por Telescope
    },
    config = function()
      -- Configurar dict.nvim
      require("dict").setup()

      -- Mapeo para buscar en el diccionario
      vim.keymap.set("n", "<leader>di", '<Cmd>lua require("dict").lookup()<CR>', { noremap = true, silent = true })
    end,
  },
}
