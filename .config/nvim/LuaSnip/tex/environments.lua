local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return
  {
    -- GENERIC ENVIRONMENT
    s({trig="beg", snippetType="autosnippet"},
      fmta(
        [[
        \begin{<>}
          <>
        \end{<>}
        ]],
        {
          i(1),
          d(2, get_visual),
          rep(1),
        }
      ),
      {condition = line_begin}
    ),
    -- ITEMIZE
    s({trig="itt", snippetType="autosnippet"},
      fmta(
        [[
        \begin{itemize}
          \item <>
        \end{itemize}
        ]],
        {
          i(0),
        }
      ),
      {condition = line_begin}
    ),
    -- ENUMERATE
    s({trig="enn", snippetType="autosnippet"},
      fmta(
        [[
        \begin{enumerate}
          \item <>
        \end{enumerate}
        ]],
        {
          i(0),
        }
      )
    ),
    -- DESCRIPTION
    s({trig="des", snippetType="autosnippet"},
      fmta(
        [[
        \begin{description}
          \item[<>] <>
        \end{description}
        ]],
        {
          i(1),
          i(2),
        }
      )
    ),
    -- ALIGN*
    s({trig="all", snippetType="autosnippet"},
      fmta(
        [[
        \begin{align*}
          <>
        \end{align*}
        ]],
        {
          i(1)
        }
      )
    ),
    -- ARRAY
    s({trig="arr", snippetType="autosnippet"},
      fmta(
        [[
        \begin{array}{<>}
          <>
        \end{array}
        ]],
        {
          i(1),
          i(2),
        }
      )
    ),
    -- EQUATION
    s({trig="dm", snippetType="autosnippet"},
      fmta(
        [[
        \[
          <>
        \]
        ]],
        {
          i(1),
        }
      ),
      { condition = line_begin }
    ),
    -- INLINE MATH
    s({trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>$<>$",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      )
    ),
    -- FIGURE
    s({trig = "fig"},
      fmta(
        [[
        \begin{figure}[H]
          \centering
          \incfig{<>}
          \caption*{<>}
          \label{fig:<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
          rep(1)
        }
      ),
      { condition = line_begin }
    ),
    -- CIRCLED
    s({trig = "ccd", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "\\circled{<>}",
        {
          d(1, get_visual),
        }
      )
    ),
    -- UNDERBRACE
    s({trig = "ubb", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "\\underbrace{<>}",
        {
          d(1, get_visual),
        }
      )
    ),
    -- OVERBRACE
    s({trig = "obb", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "\\overbrace{<>}",
        {
          d(1, get_visual),
        }
      )
    ),
    -- UNDERSET
    s({trig = "uss", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "\\underset{<>}{<>}",
        {
          d(1, get_visual),
          i(2)
        }
      )
    ),
    -- OVERSET
    s({trig = "oss", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "\\overset{<>}{<>}",
        {
          d(1, get_visual),
          i(2)
        }
      )
    ),
  }
