return {
    "teamtype/teamtype-nvim",
    keys = {
        { "<leader>ej", "<cmd>TeamtypeJumpToCursor<cr>" },
        { "<leader>ef", "<cmd>TeamtypeFollow<cr>" },
        { "<esc>", mode = { "n" }, "<cmd>TeamtypeUnfollow<cr>" },
    },
    lazy = false,
}
