-- INFO:The Aerial.nvim  plugin for Neovim provides a code outline window that allows users to efficiently
-- skim through and navigate complex code structures. It is designed to offer a clean, intuitive, and fast
-- way to explore the hierarchy of symbols in your code, such as functions, classes, and variables, enhancing
-- code readability and navigation

return {
  {
    "stevearc/aerial.nvim", -- Plugin principal de Aerial
    -- Abrir navegación de Aerial
    keys = { "<leader>sc" },
    config = function()
      -- Configurar Aerial
      require("aerial").setup({
        backends = { "lsp", "treesitter", "markdown" }, -- Excluye "php"
        -- Opcionalmente, usar on_attach para establecer keymaps cuando Aerial se adjunta a un buffer
        on_attach = function(bufnr)
          -- Saltar hacia adelante/atrás con '{' y '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })

      -- Definir keymaps globales para Aerial
      vim.keymap.set("n", "<leader>sc", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial" }) -- Alternar Aerial
      -- vim.api.nvim_set_keymap("n", "<leader>no", ":AerialNavOpen<CR>", { noremap = true, silent = true }) -- Abrir navegación de Aerial
    end,
  },
}
