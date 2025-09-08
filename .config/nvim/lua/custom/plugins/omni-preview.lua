return {
    'sylvanfranklin/omni-preview.nvim',
    dependencies = {
        -- Typst
        { 'chomosuke/typst-preview.nvim', lazy = true },
        -- CSV
        { 'hat0uma/csvview.nvim',         lazy = true },
        -- for markdown
        { 'toppair/peek.nvim',            lazy = true, build = 'deno task --quiet build:fast' },
    },
    config = function()
        require('omni-preview').setup()
        require('peek').setup { app = 'browser' }
    end,
    opts = {},
    keys = {
        { '<leader>po', '<cmd>OmniPreview start<CR>', desc = 'OmniPreview Start' },
        { '<leader>pc', '<cmd>OmniPreview stop<CR>',  desc = 'OmniPreview Stop' },
    },
}
