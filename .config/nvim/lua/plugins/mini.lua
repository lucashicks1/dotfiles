return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- EDITING PLUGINS

    -- Better Around/Inside textobjects
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Comments Util in nvim
    require('mini.comment').setup()

    require('mini.pairs').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- GENERAL PLUGINS

    -- Navigation with brackets

    -- [ + upper-suffix : go first.
    -- [ + lower-suffix : go backward.
    -- ] + lower-suffix : go forward.
    -- ] + upper-suffix : go last.
    -- E.G., Comment block = [c
    require('mini.bracketed').setup()

    -- Helpful for diffs
    require('mini.diff').setup()

    -- Autohighlight word under cursor
    require('mini.cursorword').setup()

    -- Icon provider
    require('mini.icons').setup()
  end,
}
