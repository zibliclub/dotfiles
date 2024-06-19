local helpers = require("chaffinch.plugins.LuaSnip.helper-funcs")

-- Math context detection
local tex = {}
tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end

return {
	-- FOR ALL, i.e. \forall
	s({ trig = "faa", snippetType = "autosnippet" }, {
		t("\\forall "),
	}, { condition = tex.in_mathzone }),

	-- EXISTS, i.e. \exists
	s({ trig = "exx", snippetType = "autosnippet" }, {
		t("\\exists "),
	}, { condition = tex.in_mathzone }),

	-- RIGHT ARROW, i.e. \rightarrow
	s({ trig = "ra" }, {
		t("\\rightarrow "),
	}, { condition = tex.in_mathzone }),

	-- LEFT ARROW, i.e. \leftarrow
	s({ trig = "la" }, {
		t("\\leftarrow "),
	}, { condition = tex.in_mathzone }),

	-- DIFFERENTIAL, i.e. \diff
	s({ trig = "df", priority = 2000, snippetType = "autosnippet" }, {
		t("\\diff "),
	}, { condition = tex.in_mathzone }),

	-- BASIC INTEGRAL SYMBOL, i.e. \int
	s({ trig = "in1", snippetType = "autosnippet" }, {
		t("\\int "),
	}, { condition = tex.in_mathzone }),

	-- DOUBLE INTEGRAL, i.e. \iint
	s({ trig = "in2", snippetType = "autosnippet" }, {
		t("\\iint "),
	}, { condition = tex.in_mathzone }),

	-- TRIPLE INTEGRAL, i.e. \iiint
	s({ trig = "in3", snippetType = "autosnippet" }, {
		t("\\iiint "),
	}, { condition = tex.in_mathzone }),

	-- CDOTS, i.e. \cdots
	s({ trig = "cdd", snippetType = "autosnippet" }, {
		t("\\cdots "),
	}, { condition = tex.in_mathzone }),

	-- LDOTS, i.e. \ldots
	s({ trig = "ldd", snippetType = "autosnippet" }, {
		t("\\ldots "),
	}, { condition = tex.in_mathzone }),

	-- VDOTS, i.e. \vdots
	s({ trig = "vdd", snippetType = "autosnippet" }, {
		t("\\vdots "),
	}, { condition = tex.in_mathzone }),

	-- DDOTS, i.e. \ddots
	s({ trig = "ddd", snippetType = "autosnippet" }, {
		t("\\ddots "),
	}, { condition = tex.in_mathzone }),

	-- EQUIV, i.e. \equiv
	s({ trig = "eqq", snippetType = "autosnippet" }, {
		t("\\equiv "),
	}, { condition = tex.in_mathzone }),

	-- SETMINUS, i.e. \setminus
	s({ trig = "stm", snippetType = "autosnippet" }, {
		t("\\setminus "),
	}, { condition = tex.in_mathzone }),

	-- SUBSET, i.e. \subset
	s({ trig = "sbb", snippetType = "autosnippet" }, {
		t("\\subset "),
	}, { condition = tex.in_mathzone }),

	-- SUBSETEQ, i.e. \subseteq
	s({ trig = "sbe", snippetType = "autosnippet" }, {
		t("\\subseteq "),
	}, { condition = tex.in_mathzone }),

	-- SUPSET, i.e. \supset
	s({ trig = "spp", snippetType = "autosnippet" }, {
		t("\\supset "),
	}, { condition = tex.in_mathzone }),

	-- SUPSETEQ, i.e. \supseteq
	s({ trig = "spe", snippetType = "autosnippet" }, {
		t("\\supseteq "),
	}, { condition = tex.in_mathzone }),

	-- IMPLIES, i.e. \implies
	s({ trig = ">>", snippetType = "autosnippet" }, {
		t("\\implies "),
	}, { condition = tex.in_mathzone }),

	-- IFF, i.e. \iff
	s({ trig = "<>", snippetType = "autosnippet" }, {
		t("\\iff "),
	}, { condition = tex.in_mathzone }),

	-- LESS OR EQUAL, i.e. \leqslant
	s({ trig = "<=", snippetType = "autosnippet" }, {
		t("\\leqslant "),
	}, { condition = tex.in_mathzone }),

	-- MORE OR EQUAL, i.e. \geqslant
	s({ trig = ">=", snippetType = "autosnippet" }, {
		t("\\geqslant "),
	}, { condition = tex.in_mathzone }),

	-- DOT PRODUCT, i.e. \cdot
	s({ trig = ",.", snippetType = "autosnippet" }, {
		t("\\cdot "),
	}, { condition = tex.in_mathzone }),

	-- CROSS PRODUCT, i.e. \times
	s({ trig = "xx", snippetType = "autosnippet" }, {
		t("\\times "),
	}, { condition = tex.in_mathzone }),

	-- VAR NOTHING, i.e. \varnothing
	s({ trig = "0--", snippetType = "autosnippet" }, {
		t("\\varnothing "),
	}, { condition = tex.in_mathzone }),

	-- COLONEQ, i.e. \coloneq
	s({ trig = "cqq", snippetType = "autosnippet" }, {
		t("\\coloneq "),
	}, { condition = tex.in_mathzone }),

	-- INFINITY, i.e. \infty
	s({ trig = "8" }, {
		t("\\infty "),
	}, { condition = tex.in_mathzone }),
}
