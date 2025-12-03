--INFO: which-key is a plugin for Neovim that displays a popup with possible keybindings of the command you currently type.
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "helix",
    defaults = {},
    spec = {
      {
        mode = { "n", "x" },
        { "<leader><Del>", desc = "delete Buffer", icon = "" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug", icon = "" },
        { "<leader>dp", group = "profiler" },
        { "<leader>f", group = "file/find", icon = "" },
        { "<leader>g", group = "git", icon = "󰊢" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "<leader>t", group = "toggle", icon = "" },
        { "<leader>p", group = "preview", icon = "" },
        { "<leader>o", desc = "new line below", icon = "󰉸" },
        { "<leader>O", desc = "new line above", icon = "󰉸" },
        { "<leader>,", desc = "start of line", icon = "" },
        { "<leader>.", desc = "end of line", icon = "" },
        { "<leader>ch", desc = "open Huefy", icon = "" },
        { "<leader>cx", desc = "open Shades", icon = "" },
        { "<leader>su", desc = "undotree", icon = "󰔱" },
        { "<leader>tc", desc = "comments", icon = "󰒕" },
        { "<leader>tn", desc = "clipboard", icon = "" },
        { "<leader>sna", desc = "messages", icon = "󰍢" },
        { "<leader>di", desc = "dict", icon = "" },
        { "<leader>|", desc = "vertical terminal", icon = "" },
        { "<leader>ce", ":lua run_current_file()<CR>", desc = "execute file", icon = "" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "z", group = "fold" },
        { "gu", desc = "LOWERcase", icon = "" },
        { "gU", desc = "UPPERCASE", icon = "" },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = { "<leader>w", group = "window", icon = "" },

          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        -- better descriptions
        { "gx", desc = "Open with system app" },
      },
    },
  },
  win = {
    max_modes = 30,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    {
      "<c-w><space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    if not vim.tbl_isempty(opts.defaults) then
      LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
      wk.register(opts.defaults)
    end
  end,
}
