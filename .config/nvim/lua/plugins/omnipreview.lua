-- preview things
return {
  'sylvanfranklin/omni-preview.nvim',
  dependencies = {
    -- Typst
    { 'chomosuke/typst-preview.nvim', lazy = true },
    -- CSV
    { 'hat0uma/csvview.nvim', lazy = true },
    -- for markdown
    { 'toppair/peek.nvim', lazy = true, build = 'deno task --quiet build:fast' },
  },
  config = function()
    require('omni-preview').setup()

    -- CSV
    require('csvview').setup {}

    -- Markdown
    require('peek').setup { app = 'browser' }

    -- Typst
    require('typst-preview').setup {
      debug = true,
      dependencies_bin = { ['tinymist'] = 'tinymist' },
      follow_cursor = true,
      port = 13131,

      -- This sets the path of the typst file to be the working dir of where nvim is opened
      -- By default this is normally set to the directory of the opened file; however, this sometimes breaks
      -- '--root' things, since typst cant go up a dir
      get_root = function(_)
        local root = os.getenv 'TYPST_ROOT'
        if root then
          return root
        end
        -- Use Neovim's current working directory
        return vim.fn.getcwd()
      end,
    }
  end,
}
