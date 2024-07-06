local helpers = require("chaffinch.plugins.LuaSnip.helper-funcs")
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end

return {
	-- BOLD i.e. \textbf
	s(
		{ trig = "tbb", snippetType = "autosnippet" },
		fmta("\\textbf{<>}", {
			d(1, get_visual),
		})
	),

	-- MATH FRAK i.e. \mathfrak
	s(
		{ trig = "([^%a])mfk", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\mathfrak{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- MATH CAL i.e. \mathcal
	s(
		{ trig = "([^%a])mcl", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\mathcal{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- REGULAR TEXT i.e. \text (in math environments)
	s(
		{ trig = "([^%a])tee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\text{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = tex.in_mathzone }
	),

	-- TEXT SELECTION
	s(
		{ trig = "([^%a])emm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\emph{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- ROMAN NUMERAL CAPS
	s(
		{ trig = "([^%a])rnc", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\RomanNumeralCaps{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
}
