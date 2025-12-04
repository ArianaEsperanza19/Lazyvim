-- INFO: vim-polyglot is a plugin for Vim that provides syntax and configuration support for a
-- wide variety of programming languages and file formats. It is a "language pack" that includes support for
-- over 120 languages, making it very useful for developers working with multiple languages in a single environment.
return {
  {
    "sheerun/vim-polyglot", -- Plugin de vim-polyglot
    config = function()
      -- Autocomando para habilitar corrección ortográfica en archivos específicos
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "markdown", "tex", "text" },
        callback = function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "es"
        end,
      })

      -- Función para cambiar el idioma de corrección ortográfica
      local function ChangeSpellLang(lang)
        vim.opt_local.spelllang = lang
      end

      -- Comandos personalizados para cambiar el idioma de corrección ortográfica
      vim.api.nvim_create_user_command("SpellLangEn", function()
        ChangeSpellLang("en")
      end, {})
      vim.api.nvim_create_user_command("SpellLangEs", function()
        ChangeSpellLang("es")
      end, {})
      vim.api.nvim_create_user_command("SpellLangEo", function()
        vim.opt.spell = true
        vim.opt.spelllang = "eo"
        print("Corrección ortográfica en esperanto activada")
      end, {})
      vim.api.nvim_create_user_command("DisableSpell", function()
        vim.opt.spell = false
        print("Corrección ortográfica desactivada")
      end, {})

      -- Mapeos para sugerencias ortográficas y navegación
      vim.api.nvim_set_keymap("n", "ĵz", "[s", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ĥz", "]s", { noremap = true, silent = true })

      -- Mapeos para eliminar, cambiar y cortar
      vim.api.nvim_set_keymap("n", "ĝ", "w", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "Ĝ", "W", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "diĝ", "diw", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "daĝ", "daw", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ciĝ", "ciw", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "cĝ", "cw", { noremap = true, silent = true })

      -- Mapeos para copiar
      vim.api.nvim_set_keymap("n", "ŭ", "y", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭŭ", "yy", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭnŭ", "yny", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭĝ", "yw", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭip", "yip", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭib", "yib", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭap", "yap", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭab", "yab", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭaĝ", "yaw", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŭiĝ", "yiw", { noremap = true, silent = true })

      -- Mapeos adicionales
      vim.api.nvim_set_keymap("n", "ĉ", "x", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "Ĉ", "X", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "ŝ", "q", { noremap = true, silent = true })

      -- Función para cambiar el idioma de forma cíclica
      function ChangeLang()
        -- Lista de idiomas disponibles
        local langs = { "es", "en", "eo" }

        -- Obtener el valor actual de 'spelllang' para el buffer actual
        local current_lang = vim.api.nvim_buf_get_option(0, "spelllang")

        -- Dividir 'spelllang' en caso de que tenga múltiples valores separados por comas
        local current_lang_single = current_lang:match("^[^,]+") or "en"

        -- Encontrar el siguiente idioma en la lista
        local next_lang = nil
        for i, lang in ipairs(langs) do
          if lang == current_lang_single then
            -- Si es el último idioma, volver al primero
            next_lang = langs[i + 1] or langs[1]
            break
          end
        end

        -- Si no se encontró el idioma actual en la lista, usar el primero
        next_lang = next_lang or langs[1]

        -- Establecer el nuevo idioma en 'spelllang'
        vim.api.nvim_buf_set_option(0, "spelllang", next_lang)
      end

      -- Asignar la función al atajo <F6>
      vim.api.nvim_set_keymap("n", "<F6>", ":lua ChangeLang()<CR>", { noremap = true, silent = true })
    end,
  },
}
