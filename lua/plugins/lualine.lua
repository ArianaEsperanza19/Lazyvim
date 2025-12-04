-- INFO: Lualine is a highly configurable and customizable statusline plugin for Neovim. It allows you to create a
-- statusline that perfectly fits your needs and preferences, displaying useful information at a glance.
-- Lualine enhances your productivity by providing an informative and visually appealing statusline that can
-- be tailored to show exactly what you want.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
        -- Agregamos la función personalizada aquí
        function()
          if vim.o.spell then
            local spelllang = vim.api.nvim_buf_get_option(0, "spelllang")
            return spelllang
          else
            return ""
          end
        end,
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
