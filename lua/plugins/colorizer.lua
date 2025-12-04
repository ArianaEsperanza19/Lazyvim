--INFO: Colorizer is a plugin for Neovim that highlights color codes (like hex, rgb, etc.) in the text with
--their actual colors.
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
}
