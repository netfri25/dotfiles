return {
    "ethersync/ethersync-nvim",
    keys = {
        { "<leader>ej", "<cmd>EthersyncJumpToCursor<cr>" },
        { "<leader>ef", "<cmd>EthersyncFollow<cr>" },
        { "<esc>", mode = { "n" }, "<cmd>EthersyncUnfollow<cr>" },
    },
    lazy = false,
}
