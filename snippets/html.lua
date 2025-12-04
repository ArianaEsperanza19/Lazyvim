local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("html", {
  s("doc!", {
    t({ "<!DOCTYPE html>", "" }),
    t({ "<html>", "" }),
    t('<meta charset="UTF-8">', ""),
    t('<style src="style.css"></style>'),
    t({ "<title>Document" }),
    i(1, ""),
    t({ "</title>", "" }),
    t({ "<head>", "" }),
    t({ "</head>", "" }),
    t({ "<body>", "" }),
    i(0),
    t({ "</body>", "" }),
    t({ '<script src="script.js"></script>', "" }),
    t({ "</html>", "" }),
  }),

  -- barra de busqueda
  s(
    "navbarsearch", -- El "prefix" o palabra clave que escribirás para activar el snippet
    {
      t({ "<nav>", "" }),
      t('<form action="'),
      i(1, ""), -- Aquí es donde el cursor se posicionará primero (posición $1)
      t({ '" method="POST">', "" }),
      t({ '<input type="text" name="busqueda">', "" }),
      t({ '<input type="submit" value="Buscar">', "" }),
      t({ "</form>", "" }),
      t("</nav>"),
      i(0), -- Posición final del cursor después de saltar (posición $0)
    },
    { description = "HTML Navigation Bar with Search Form" } -- Descripción del snippet
  ),
  -- Lista de elementos numerados
  s(
    "ollist", -- El prefijo que escribes para activar el snippet
    {
      t({ "<ol>", "" }),
      t("\t<li>"),
      i(1),
      t({ "</li>", "" }), -- Cursor inicial en el primer <li>
      t("\t<li>"),
      i(2),
      t({ "</li>", "" }), -- Siguiente cursor
      t("\t<li>"),
      i(3),
      t({ "</li>", "" }), -- Tercer cursor
      t("</ol>"),
      i(0), -- Cursor final
    },
    { description = "HTML Ordered List with three items" }
  ),
  -- Lista de elementos desordenados
  s(
    "ullist", -- El prefijo que escribes para activar el snippet
    {
      t({ "<ul>", "" }),
      t("\t<li>"),
      i(1),
      t({ "</li>", "" }), -- Cursor inicial en el primer <li>
      t("\t<li>"),
      i(2),
      t({ "</li>", "" }), -- Siguiente cursor
      t("\t<li>"),
      i(3),
      t({ "</li>", "" }), -- Tercer cursor
      t("</ul>"),
      i(0), -- Cursor final
    },
    { description = "HTML Ordered List with three items" }
  ),

  -- Css
  s(
    "csslink", -- El prefijo que escribirás para activar el snippet
    {
      t('<link rel="stylesheet" href="'),
      i(1, ""), -- Cursor en el atributo href
      t('">'),
      i(0), -- Cursor final
    },
    { description = "HTML Link to external CSS stylesheet" }
  ),

  --Scriot
  s(
    "jslink", -- El prefijo que escribirás para activar el snippet
    {
      t('<script src="'),
      i(1, ""), -- Cursor en el atributo src
      t('"></script>'),
      i(0), -- Cursor final
    },
    { description = "HTML Link to external JavaScript file" }
  ),

  -- Div con clase
  s(
    "divc", -- Prefijo para activar
    {
      t('<div class="'),
      i(1),
      t('">'), -- Cursor en la clase ($1)
      i(0),
      t("</div>"), -- Cursor final dentro del div ($0)
    },
    { description = "HTML Div with Class" }
  ),

  -- Div con id
  s(
    "divid", -- Prefijo para activar
    {
      t('<div id="'),
      i(1),
      t('">'), -- Cursor en el ID ($1)
      i(0),
      t("</div>"), -- Cursor final dentro del div ($0)
    },
    { description = "HTML Div with ID" }
  ),
  -- Imagen
  s(
    "imgres", -- Prefijo para activar
    {
      t('<img src="assets/'),
      i(1),
      t('.jpg" alt="'),
      i(2),
      t('" class="">'),
      i(0),
    },
    { description = "HTML Responsive Image" }
  ),
  -- Formulario basico
  s(
    "form", -- Prefijo para activar
    {
      t('<form action="'),
      i(1),
      t('" method="'),
      i(2),
      t({ '">', "" }),
      i(0),
      t("</form>"),
    },
    { description = "HTML Form" }
  ),
  -- Input
  s(
    "input", -- Prefijo para activar
    {
      t('<label for="'),
      i(1),
      t('">'),
      i(2),
      t({ ":</label>", "" }),
      t('<input type="text" id="'),
      rep(1),
      t('" name="'),
      rep(1),
      t('" placeholder="'),
      i(3),
      t('">'),
      i(0),
    },
    { description = "HTML Text Input Field" }
  ),
  -- boton con estilo
  s(
    "btnstyle", -- Prefijo para activar
    {
      t('<button class="btn btn-'),
      i(1),
      t('">'),
      i(2),
      t("</button>"),
      i(0),
    },
    { description = "HTML Styled Button" }
  ),
})
