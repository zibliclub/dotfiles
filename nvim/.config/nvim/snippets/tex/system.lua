local helpers = require("chaffinch.plugins.LuaSnip.helper-funcs")
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	-- CHAPTER
	s(
		{ trig = "h0", snippetType = "autosnippet" },
		fmta([[\chapter{<>}]], {
			d(1, get_visual),
		}),
		{ condition = line_begin }
	),

	-- CHAPTER WITHOUT NUMBERING
	s(
		{ trig = "hh0", snippetType = "autosnippet" },
		fmta([[\chapter*{<>}]], {
			d(1, get_visual),
		}),
		{ condition = line_begin }
	),

	-- SECTION
	s(
		{ trig = "h1", snippetType = "autosnippet" },
		fmta([[\section{<>}]], {
			d(1, get_visual),
		}),
		{ condition = line_begin }
	),

	-- SUBSECTION
	s(
		{ trig = "h2", snippetType = "autosnippet" },
		fmta([[\subsection{<>}]], {
			d(1, get_visual),
		}),
		{ condition = line_begin }
	),

	-- SUBSUBSECTION
	s(
		{ trig = "h3", snippetType = "autosnippet" },
		fmta([[\subsubsection{<>}]], {
			d(1, get_visual),
		}),
		{ condition = line_begin }
	),

	-- LESSON
	s(
		{ trig = "lesson", snipperType = "autosnippet" },
		fmta([[\lesson{<>}{от <> <> <> <>}{<>}]], {
			i(1),
			t(os.date("%d")),
			i(2),
			t(os.date("%Y")),
			t(os.date("%H:%M")),
			d(3, get_visual),
		}),
		{ condition = line_begin }
	),
}
