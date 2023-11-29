local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

return {
  -- current date
  s({ trig = "ymd", name = "Current date", dscr = "Insert the current date" }, {
    p(os.date, "%Y-%m-%d"),
  }),
  s({ trig = "loc", name = "localhost", dscr = "Insert http://localhost" }, {
    t("http://localhost"),
  }),
  s({ trig = "P", name = "POST /", dscr = "Insert POST /" }, {
    t("POST /"),
  }),
  s({ trig = "PU", name = "PUT /", dscr = "Insert PUT /" }, {
    t("PUT /"),
  }),
  s({ trig = "G", name = "GET /", dscr = "Insert GET /" }, {
    t("GET /"),
  }),
  s({ trig = "D", name = "DELETE /", dscr = "Insert DELETE /" }, {
    t("DELETE /"),
  }),
}
