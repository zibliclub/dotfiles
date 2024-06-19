local helpers = require("chaffinch.plugins.LuaSnip.helper-funcs")
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	s({ trig = "q" }, {
		t("\\quad "),
	}),

	s({ trig = "qq", snippetType = "autosnippet" }, {
		t("\\qquad "),
	}),

	s({ trig = "npp", snippetType = "autosnippet" }, {
		t({ "\\newpage", "" }),
	}, { condition = line_begin }),

	s({ trig = "ii", snippetType = "autosnippet" }, {
		t("\\item "),
	}, { condition = line_begin }),
}
