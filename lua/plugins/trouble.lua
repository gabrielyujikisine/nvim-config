return {
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "[t",
                "<cmd>Trouble diagnostics next<cr>",
                desc = "Next Diagnostic",
            },
            {
                "]t",
                "<cmd>Trouble diagnostics prev<cr>",
            },
        },
    },
}
