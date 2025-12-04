local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

-- Cabecera de Bash
ls.add_snippets("sh", {
  s("bin", {
    t("#!/bin/bash"),
    i(0),
  }),
  -- For de Bash
  s("bashfor", {
    t("for ((i = 1; i <= $"),
    i(1, "limite"),
    t({ "; i++)); do", "" }),
    i(2),
    t("done"),
  }),
  -- For doble
  s("bashfor2", {
    t("for i in {1..10}\n"),
    t("do\n"),
    t("    for j in {1..5}\n"),
    t("    do\n"),
    t('        echo "i: $i, j: $j"\n'),
    t("    done\n"),
    t("done\n"),
  }),
  -- Paréntesis
  s("paren", {
    t("$(("),
    i(1, "expresion"),
    t("))"),
  }),
  -- Random
  s("rand", {
    t({ "$((" }),
    i(1, "a"),
    t({ " + RANDOM % (" }),
    i(2, "b"),
    t({ " - " }),
    rep(1),
    t({ " + 1)))", "" }),
  }),
})
