local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return
  {
    -- CHAPTER
    s({trig="h0", snippetType="autosnippet"},
      fmta(
        [[\chapter{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- CHAPTER WITHOUT NUMBERING
    s({trig="hh0", snippetType="autosnippet"},
      fmta(
        [[\chapter*{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- SECTION
    s({trig="h1", snippetType="autosnippet"},
      fmta(
        [[\section{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- SUBSECTION
    s({trig="h2", snippetType="autosnippet"},
      fmta(
        [[\subsection{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- SUBSUBSECTION
    s({trig="h3", snippetType="autosnippet"},
      fmta(
        [[\subsubsection{<>}]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- LESSON
    s({trig="lesson", snipperType="autosnippet"},
      fmta(
        [[\lesson{<>}{от <> <> <> <>}{<>}]],
        {
          i(1),
          t(os.date("%d")),
          i(2),
          t(os.date("%Y")),
          t(os.date("%H:%M")),
          d(3, get_visual),
        }
      )
    ),
  }
