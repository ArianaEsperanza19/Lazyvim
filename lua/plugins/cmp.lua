--INFO: This file is a configuration for the nvim-cmp plugin in Neovim, which provides autocompletion features.
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        mapping = {
          -- 1. Confirmar la selección (sin seleccionar automáticamente el primer item)
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- 2. Lógica para el Tabulador:
          -- La lógica de <Tab> es crucial. Debe priorizar saltar en LuaSnip.
          ["<Tab>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if cmp.visible() then
              -- Si el menú de CMP está visible, selecciona el siguiente item.
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              -- Si estás dentro de un snippet, salta al siguiente placeholder.
              luasnip.jump()
            else
              -- De lo contrario, inserta un Tab normal.
              fallback()
            end
          end, { "i", "s" }), -- Aplicar en modos Insertar y Snippet

          -- <S-Tab> (Shift+Tab) para saltar hacia atrás en los snippets
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jump(-1) then
            -- Salta al placeholder anterior.
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })
    end,
  },
}
