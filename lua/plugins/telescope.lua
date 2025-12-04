-- INFO: Telescope is a plugin for Neovim that provides a fast and flexible tool for finding and navigating through files,
-- buffers, and other items in your workspace.
-- Note: To use live_grep you need have installed "ripgrep"
-- sudo apt install ripgrep
-- It can make errors if Trouble had not been installed before.
return {
  {
    "nvim-telescope/telescope.nvim", -- Plugin principal de Telescope
    dependencies = {
      "nvim-lua/plenary.nvim", -- Dependencia requerida por Telescope
      "nvim-tree/nvim-web-devicons", -- Dependencia opcional para iconos
      "tom-pollak/telescope-marks.nvim",
    },
    config = function()
      -- Importar módulos necesarios
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              width = 0.9, -- Ajusta el ancho del menú
              height = 0.8, -- Ajusta la altura del menú
              preview_width = 0.5, -- Define el ancho de la vista previa
            },
          },
          mappings = {
            i = { ["<c-t>"] = require("trouble.sources.telescope").open },
            n = { ["<c-t>"] = require("trouble.sources.telescope").open },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  },
}
