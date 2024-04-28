local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return
{
  -- OVER LINE
  s({trig = "oll", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "\\overline{<>}",
      {
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- UNDER LINE
  s({trig = "ull", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "\\underline{<>}",
      {
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- OVER SET
  s({trig = "oss", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "\\overset{<>}{<>}",
      {
        i(1),
        d(2, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- UNDER SET
  s({trig = "uss", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "\\underset{<>}{<>}",
      {
        i(1),
        d(2, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUPERSCRIPT
  s({trig = "([%w%)%]%}])'", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUBSCRIPT
  s({trig = "([%w%)%]%}]);", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUBSCRIPT AND SUPERSCRIPT
  s({trig = "([%w%)%]%}])__", wordTrig=false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- VECTOR, i.e. \vec
  s({trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\vec{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- FRACTION
  s({trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\frac{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- ABSOLUTE VALUE
  s({trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "<>\\abs{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SQUARE ROOT
  s({trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sqrt{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM
  s({trig = "([^%a])s", wordTrig = false, regTrig = true},
    fmta(
      "<>\\sum",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM with lower limit
  s({trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- SUM with upper and lower limit
  s({trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- PROD
  s({trig = "([^%a])p", wordTrig = false, regTrig = true},
    fmta(
      "<>\\prod",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- PROD with lower limit
  s({trig = "([^%a])pD", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\prod_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- PROD with upper and lower limit
  s({trig = "([^%a])pdd", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\prod_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG CUP
  s({trig = "([^%a])bcu", wordTrig = false, regTrig = true},
    fmta(
      "<>\\bigcup",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG CUP with lower limit
  s({trig = "([^%a])bcU", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\bigcup_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG CUP with upper and lower limit
  s({trig = "([^%a])bcuu", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\bigcup_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG CAP
  s({trig = "([^%a])bca", wordTrig = false, regTrig = true},
    fmta(
      "<>\\bigcap",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG CAP with lower limit
  s({trig = "([^%a])bcA", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\bigcap_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG CAP with upper and lower limit
  s({trig = "([^%a])bcaa", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\bigcap_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- LIM
  s({trig = "([^%a])l", wordTrig = false, regTrig = true},
    fmta(
      "<>\\lim",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- LIM with lower limit
  s({trig = "([^%a])lM", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\lim_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- LIM with upper and lower limit
  s({trig = "([^%a])lmm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\lim_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- RIGHT ARROW
  s({trig = "([^%a])ra", wordTrig = false, regTrig = true},
    fmta(
      "<>\\rightarrow ",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG RIGHT ARROW
  s({trig = "([^%a])Ra", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\Rightarrow ",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- X RIGHT ARROW
  s({trig = "([^%a])xra", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\xrightarrow[<>]{<>} ",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- LEFT ARROW
  s({trig = "([^%a])la", wordTrig = false, regTrig = true},
    fmta(
      "<>\\leftarrow ",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BIG LEFT ARROW
  s({trig = "([^%a])La", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\Leftarrow ",
      {
        f( function(_, snip) return snip.captures[1] end ),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- X LEFT ARROW
  s({trig = "([^%a])xla", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\xleftarrow[<>]{<>} ",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- INTEGRAL with upper and lower limit
  s({trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\int_{<>}^{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- BOXED command
  s({trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\boxed{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual)
      }
    ),
    {condition = tex.in_mathzone}
  ),


  --
  -- BEGIN STATIC SNIPPETS
  --

  -- DIFFERENTIAL, i.e. \diff
  s({trig = "df", snippetType="autosnippet", priority=2000, snippetType="autosnippet"},
    {
      t("\\diff"),
    },
    {condition = tex.in_mathzone}
  ),
  -- BASIC INTEGRAL SYMBOL, i.e. \int
  s({trig = "in1", snippetType="autosnippet"},
    {
      t("\\int"),
    },
    {condition = tex.in_mathzone}
  ),
  -- DOUBLE INTEGRAL, i.e. \iint
  s({trig = "in2", snippetType="autosnippet"},
    {
      t("\\iint"),
    },
    {condition = tex.in_mathzone}
  ),
  -- TRIPLE INTEGRAL, i.e. \iiint
  s({trig = "in3", snippetType="autosnippet"},
    {
      t("\\iiint"),
    },
    {condition = tex.in_mathzone}
  ),
  -- PARALLEL SYMBOL, i.e. \parallel
  s({trig = "||", snippetType="autosnippet"},
    {
      t("\\parallel"),
    }
  ),
  -- CDOTS, i.e. \cdots
  s({trig = "cdd", snippetType="autosnippet"},
    {
      t("\\cdots"),
    }
  ),
  -- LDOTS, i.e. \ldots
  s({trig = "ldd", snippetType="autosnippet"},
    {
      t("\\ldots"),
    }
  ),
  -- VDOTS, i.e. \vdots
  s({trig = "vdd", snippetType="autosnippet"},
    {
      t("\\vdots"),
    }
  ),
  -- EQUIV, i.e. \equiv
  s({trig = "eqq", snippetType="autosnippet"},
    {
      t("\\equiv "),
    }
  ),
  -- SETMINUS, i.e. \setminus
  s({trig = "stm", snippetType="autosnippet"},
    {
      t("\\setminus "),
    }
  ),
  -- SUBSET, i.e. \subset
  s({trig = "sbb", snippetType="autosnippet"},
    {
      t("\\subset "),
    }
  ),
  -- SUPSET, i.e. \supset
  s({trig = "spp", snippetType="autosnippet"},
    {
      t("\\supset "),
    }
  ),
  -- SUBSETEQ, i.e. \subseteq
  s({trig = "sbe", snippetType="autosnippet"},
    {
      t("\\subseteq "),
    }
  ),
  -- SUPSETEQ, i.e. \supseteq
  s({trig = "spe", snippetType="autosnippet"},
    {
      t("\\supseteq "),
    }
  ),
  -- PROPTO, i.e. \propto
  s({trig = "pt", snippetType="autosnippet"},
    {
      t("\\propto "),
    },
    {condition = tex.in_mathzone}
  ),
  -- IMPLIES, i.e. \implies
  s({trig = ">>", snippetType="autosnippet"},
    {
      t("\\implies "),
    }
  ),
  -- IFF, i.e. \iff
  s({trig = "<>", snippetType="autosnippet"},
    {
      t("\\iff "),
    }
  ),
  -- DOT PRODUCT, i.e. \cdot
  s({trig = ",.", snippetType="autosnippet"},
    {
      t("\\cdot "),
    }
  ),
  -- CROSS PRODUCT, i.e. \times
  s({trig = "xx", snippetType="autosnippet"},
    {
      t("\\times "),
    }
  ),
  -- CUP, i.e. \cup
  s({trig = "cuu", snippetType="autosnippet"},
    {
      t("\\cup "),
    }
  ),
  -- CAP, i.e. \cap
  s({trig = "caa", snippetType="autosnippet"},
    {
      t("\\cap "),
    }
  ),
  -- VAR NOTHING, i.e. \varnothing
  s({trig = "0-", snippetType="autosnippet"},
    {
      t("\\varnothing "),
    }
  ),
  -- FOR ALL, i.e. \forall
  s({trig = "faa", snippetType="autosnippet"},
    {
      t("\\forall "),
    }
  ),
  -- EXISTS, i.e. \exists
  s({trig = "exx", snippetType="autosnippet"},
    {
      t("\\exists "),
    }
  ),
  -- LEQSLANT
  s({trig = "leq", snippetType="autosnippet"},
    {
      t("\\leqslant "),
    }
  ),
  -- GEQSLANT
  s({trig = "geq", snippetType="autosnippet"},
    {
      t("\\geqslant "),
    }
  ),
  -- COLONEQQ
  s({trig = ":=", snippetType="autosnippet"},
    {
      t("\\coloneqq "),
    }
  ),
  -- EQQCOLON
  s({trig = "=:", snippetType="autosnippet"},
    {
      t("\\eqqcolon "),
    }
  ),
  -- INFTY
  s({trig = "8"},
    {
      t("\\infty "),
    }
  ),
  -- MIN
  s({trig = "m"},
    {
      t("\\min "),
    }
  ),
  -- MAX
  s({trig = "M"},
    {
      t("\\max "),
    }
  ),
}
