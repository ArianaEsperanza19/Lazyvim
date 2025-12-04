-- INFO: ~/.config/nvim/lua/plugins/peek.lua
-- Peek es un plugin para Neovim que permite previsualizar archivos Markdown en tiempo real en tu navegador preferido.
-- Necesita Deno para funcionar correctamente.
-- Instalación de Deno:
-- curl -fsSL https://deno.land/x/install/install.sh | sh
-- Verifica si deno esta instalado y cual es su ubicacion.
-- Puedes usar deno --version y which deno para verificar.
-- Agregalo al path de tu sistema.
-- export PATH="/home/ariana/.deno/bin:$PATH" y reinicia tu terminal.
-- Asegurate de que el ejecutable de deno tenga los permisos adecuados.
-- sudo chmod +x /home/ariana/.deno/bin/deno
-- Si el `main.bundle.js` ejecuta el comando de construccion dentro del directorio de Peek
-- cd ~/.local/share/nvim/lazy/peek.nvim && deno task --quiet build:fast
-- Tambien instala la siguiente dependencia: sudo apt install libwebkit2gtk-4.0-37
-- NOTA: Si usas Zathura para visualizar, instala xdotool: sudo apt install xdotool
-- Características:
-- - Carga automática de vista previa al abrir un archivo Markdown.
-- - Cierre automático de la vista previa al eliminar el buffer.
-- - Resaltado de sintaxis.
-- - Temas oscuro y claro.
-- - Actualización en tiempo real.
-- Atajo para abrir/cerrar Peek: <leader>sm

return {
  {
    "toppair/peek.nvim", -- Plugin principal de Peek
    build = "deno task --quiet build:fast", -- Compilar el plugin si es necesario
    ft = "markdown", -- Cargar el plugin solo para archivos `.md`
    config = function()
      -- Configurar Peek
      require("peek").setup({
        auto_load = true, -- Cargar automáticamente la vista previa al entrar en un buffer markdown
        close_on_bdelete = true, -- Cerrar la ventana de vista previa al borrar el buffer

        syntax = true, -- Habilitar resaltado de sintaxis, puede afectar el rendimiento

        theme = "dark", -- 'dark' o 'light'

        update_on_change = true, -- Actualizar la vista previa al cambiar el contenido

        app = "browser", -- 'webview', 'browser', cadena de texto o una tabla de cadenas

        filetype = { "markdown" }, -- Lista de tipos de archivos a reconocer como markdown

        -- Relevante si update_on_change está activado
        throttle_at = 200000, -- Empezar a limitar cuando el archivo exceda esta cantidad de bytes
        throttle_time = "auto", -- Cantidad mínima de tiempo en milisegundos que debe pasar antes de iniciar un nuevo renderizado
      })

      local peek = require("peek")

      -- Crear comandos para abrir y cerrar Peek
      vim.api.nvim_create_user_command("PeekOpen", function()
        if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == "markdown" then
          vim.fn.system("i3-msg split horizontal") -- Dividir la ventana horizontalmente en i3wm
          peek.open()
        end
      end, {})

      vim.api.nvim_create_user_command("PeekClose", function()
        if peek.is_open() then
          peek.close()
          vim.fn.system("i3-msg move left") -- Mover la ventana en i3wm
        end
      end, {})

      -- Añadir el atajo de teclado para abrir o cerrar Peek
      vim.api.nvim_set_keymap("n", "<leader>pm", ":lua peek_toggle()<CR>", { noremap = true, silent = true })

      -- Definir la función para alternar Peek
      _G.peek_toggle = function()
        if peek.is_open() then
          vim.cmd("PeekClose")
        else
          vim.cmd("PeekOpen")
        end
      end
    end,
  },
}
