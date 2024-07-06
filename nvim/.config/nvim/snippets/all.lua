local helpers = require("chaffinch.plugins.LuaSnip.helper-funcs")
local get_visual = helpers.get_visual

return {
  -- Paired parentheses
  s({ trig = "(", wordTrig = false, snippetType = "autosnippet" }, {
    t("("),
    d(1, get_visual),
    t(")"),
  }),
  -- Lorem ipsum
  s(
    { trig = "lipsum" },
    fmta(
      [[
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        ]],
      {}
    )
  ),
}
