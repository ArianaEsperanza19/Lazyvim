local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("c", {
  -- Snippet para for
  s("for", {
    t("for (int "),
    i(1, "i"),
    t(" = 0; "),
    t(i(1)),
    t(" < "),
    i(2, "n"),
    t("; "),
    t(i(1)),
    t("++) {"),
    t({ "", "    " }),
    i(0, "// código..."),
    t({ "", "}" }),
  }),

  -- Snippet para for doble
  s("ford", {
    t("for (int "),
    i(1, "i"),
    t(" = 0; "),
    t(i(1)),
    t(" < "),
    i(2, "n"),
    t("; "),
    t(i(1)),
    t("++) {"),
    t({ "", "    for (int " }),
    i(3, "j"),
    t(" = 0; "),
    t(i(3)),
    t(" < "),
    i(4, "m"),
    t("; "),
    t(i(3)),
    t("++) {"),
    t({ "", "        " }),
    i(0, "// código..."),
    t({ "", "    }", "}" }),
  }),

  -- Snippet para while
  s("while", {
    t("while ("),
    i(1, "condición"),
    t({ ") {", "    " }),
    i(0, "// código..."),
    t({ "", "}" }),
  }),

  -- Snippet para do-while
  s("dowhile", {
    t({ "do {", "    " }),
    i(0, "// código..."),
    t({ "", "} while (" }),
    i(1, "condición"),
    t({ ");" }),
  }),

  -- Snippet para if
  s("if", {
    t("if ("),
    i(1, "condición"),
    t({ ") {", "    " }),
    i(0, "// código..."),
    t({ "", "}" }),
  }),

  -- Snippet para switch
  s("switch", {
    t("switch ("),
    i(1, "expresión"),
    t({ ") {", "    case " }),
    i(2, "valor"),
    t({ ":", "        " }),
    i(3, "// código..."),
    t({ "", "        break;", "    default:", "        " }),
    i(0, "// código por defecto..."),
    t({ "", "}" }),
  }),

  s("rm", {
    t("("),
    i(1, "int"), -- Aquí puedes escribir el tipo de dato (int, char, float, etc.)
    t("*)malloc(sizeof("),
    rep(1), -- Repite lo que escribiste en i(1)
    t("));"),
  }),

  s("sizeof_array", {
    t("sizeof("),
    i(1, "A"),
    t(") / sizeof("),
    rep(1),
    t("[0]);"),
  }),
})
