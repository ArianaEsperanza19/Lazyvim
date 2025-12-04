--INFO: Its a plugin that provides easy and efficient ways to add, change, and delete surrounding characters or tags in text.
return {
  {
    "kylechui/nvim-surround", -- Plugin principal de nvim-surround
    keys = { "]n", "]y", "]Y", "]v", "]V", "]x", "]/" },
    event = "VeryLazy", -- Cargar el plugin de manera diferida
    config = function()
      -- Configuración principal de nvim-surround
      require("nvim-surround").setup({
        -- Keymaps personalizados
        keymaps = {
          insert = false, -- Modo Insert: <C-g>s (desactivado)
          insert_line = false, -- Modo Insert (línea): <C-g>S (desactivado)
          normal_line = "]n", -- Modo normal -> ]n + lineas + direccion
          normal_cur = "]y", -- Modo Normal (línea actual): yss
          normal_cur_line = "]Y", -- Modo Normal (línea actual): ySS
          visual = "]v", -- Modo Visual: S
          visual_line = "]V", -- Modo Visual (línea): gS
          delete = "]x", -- Eliminar surrounding en modo normal
          change = "]/", -- Cambiar surrounding en modo normal
        },
        surrounds = {
          -- Surroundings personalizados
          ["("] = { "( ", " )" }, -- Paréntesis con espacio
          [")"] = { "(", ")" }, -- Paréntesis sin espacio
          ["{"] = { "{ ", " }" }, -- Llaves con espacio
          ["}"] = { "{", "}" }, -- Llaves sin espacio
          ["<"] = { "< ", " >" }, -- Ángulos con espacio
          [">"] = { "<", ">" }, -- Ángulos sin espacio
          ["["] = { "[ ", " ]" }, -- Corchetes con espacio
          ["]"] = { "[", "]" }, -- Corchetes sin espacio
          ['"'] = { '"', '"' }, -- Comillas dobles
          ["'"] = { "'", "'" }, -- Comillas simples
          ["`"] = { "`", "`" }, -- Acentos graves
          -- Triples de comillas
          ["$"] = {
            add = function()
              return { "```", "```" }
            end,
          },
          -- Negrita markdown
          ["n"] = {
            add = function()
              return { "**", "**" }
            end,
          },
          ["k"] = {
            add = function()
              return { "_", "_" }
            end,
          },
          ["s"] = {
            add = function()
              return { "~~", "~~" }
            end,
          },
          ["l"] = {
            add = function()
              return { "==", "==" }
            end,
            target = { "==", "==" },
            command = { "==", "==" },
          },
          ["?"] = {
            add = function()
              return { "¿", "?" }
            end,
            delete = function()
              return require("nvim-surround.config").get_selections({
                char = "?",
                pattern = "^(¿)().-(?)()$",
              })
            end,
            change = function()
              return { "¿", "?" }
            end,
          },
          ["!"] = {
            add = function()
              return { "¡", "!" }
            end,
          },
        },
      })
    end,
  },
}
