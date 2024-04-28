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
    -- DEFINITION WITHOUT NAME
    s({trig="deff", snippetType="autosnippet"},
      fmta(
        [[
          \begin{definition}
            <>
          \end{definition}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- DEFINITION WITH NAME
    s({trig="def[", snippetType="autosnippet"},
      fmta(
        [[
          \begin{definition}[<>]
            <>
          \end{definition}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- EXAMPLE without name
    s({trig="egg", snippetType="autosnippet"},
      fmta(
        [[
          \begin{eg}
            <>
          \end{eg}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- EXAMPLE with name
    s({trig="eg[", snippetType="autosnippet"},
      fmta(
        [[
          \begin{eg}[<>]
            <>
          \end{eg}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- THEOREM WITHOUT NAME
    s({trig="thmm", snippetType="autosnippet"},
      fmta(
        [[
          \begin{theorem}
            <>
          \end{theorem}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- THEOREM WITH NAME
    s({trig="thm[", snippetType="autosnippet"},
      fmta(
        [[
          \begin{theorem}[<>]
            <>
          \end{theorem}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- LEMMA WITHOUT NAME
    s({trig="lemm", snippetType="autosnippet"},
      fmta(
        [[
          \begin{lemma}
            <>
          \end{lemma}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- LEMMA WITH NAME
    s({trig="lem[", snippetType="autosnippet"},
      fmta(
        [[
          \begin{lemma}[<>]
            <>
          \end{lemma}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- PROOF
    s({trig="prf", snippetType="autosnippet"},
      fmta(
        [[
          \begin{proof}
            <>
          \end{proof}
        ]],
        {
          i(1),
        }
      ),
      { condition = line_begin }
    ),
    -- NOTE WITHOUT NAME
    s({trig="ntt", snippetType="autosnippet"},
      fmta(
        [[
          \begin{note}
            <>
          \end{note}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- NOTE WITH NAME
    s({trig="nt[", snippetType="autosnippet"},
      fmta(
        [[
          \begin{note}[<>]
            <>
          \end{note}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- PROPERTY WITHOUT NAME
    s({trig="prp", snippetType="autosnippet"},
      fmta(
        [[
          \begin{property}
            <>
          \end{property}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- PROPERTY WITH NAME
    s({trig="pr[", snippetType="autosnippet"},
      fmta(
        [[
          \begin{property}[<>]
            <>
          \end{property}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- CRITERION WITHOUT NAME
    s({trig="crr", snippetType="autosnippet"},
      fmta(
        [[
          \begin{crit}
            <>
          \end{crit}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- CRITERION WITH NAME
    s({trig="cr[", snippetType="autosnippet"},
      fmta(
        [[
          \begin{crit}[<>]
            <>
          \end{crit}
        ]],
        {
          i(1),
          i(2)
        }
      ),
      { condition = line_begin }
    ),
    -- COROLLARY
    s({trig="cll", snippetType="autosnippet"},
      fmta(
        [[
          \begin{corollary}
            <>
          \end{corollary}
        ]],
        {
          i(1)
        }
      ),
      { condition = line_begin }
    ),
    -- REMARK
    s({trig="rmm", snippetType="autosnippet"},
      fmta(
        [[
          \begin{remark}
            <>
          \end{remark}
        ]],
        {
          i(1),
        }
      ),
      { condition = line_begin }
    ),
    -- NOTATION
    s({trig="ntn", snippetType="autosnippet"},
      fmta(
        [[
          \begin{notation}
            <>
          \end{notation}
        ]],
        {
          i(1),
        }
      ),
      { condition = line_begin }
    ),
  }
