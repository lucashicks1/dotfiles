return {
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        opts = {
            direction = 'float',
            persist_mode = true,
            persist_size = true,
        },
        config = function(_, opts)
            require('toggleterm').setup(opts)
            vim.keymap.set('n', '\\', '<CMD>ToggleTerm<CR>', { desc = 'Toggle floating terminal', silent = true })
        end,
    },
}
