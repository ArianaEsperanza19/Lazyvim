-- INFO: LuaSnip is a highly flexible and extensible snippet plugin for Neovim, written in Lua.
-- It allows users to define and use code snippets efficiently, helping to speed up the coding process
-- by providing reusable templates that can be quickly expanded. LuaSnip supports various programming languages and
-- integrates seamlessly with other plugins, enhancing overall productivity.
return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = (not LazyVim.is_win())
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}
