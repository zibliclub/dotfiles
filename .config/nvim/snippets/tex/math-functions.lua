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
  -- SUPERSCRIPT
  s(
    { trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>^{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SUBSCRIPT
  s(
    { trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>_{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SUBSCRIPT AND SUPERSCRIPT
  s(
    { trig = "([%w%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>_{<>}^{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SUPERSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a superscript.
  s(
    { trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>^{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SUBSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a subscript.
  s(
    { trig = "([%w%)%]%}]):([%w])", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  -- FRACTION
  s(
    { trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\frac{<>}{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),

  -- ABSOLUTE VALUE
  s(
    { trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\abs{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),

  -- X RIGHT ARROW
  s(
    { trig = "([^%a])xra", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\xrightarrow[<>]{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),

  -- X LEFT ARROW
  s(
    { trig = "([^%a])xla", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\xleftarrow[<>]{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SUM with lower limit
  s(
    { trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sum_{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SUM with upper and lower limit
  s(
    { trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sum_{<>}^{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),

  -- INTEGRAL with lower limit
  s(
    { trig = "([^%a])inT", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\int_{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),

  -- INTEGRAL with upper and lower limit
  s(
    { trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\int_{<>}^{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),

  -- BOXED command
  s(
    { trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\boxed{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SQRT
  s(
    { trig = "([^%a])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sqrt{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),

  -- SQRT
  s(
    { trig = "([^%a])sQ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sqrt[<>]{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
}
