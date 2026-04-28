return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = {}, -- Disables csharpier for C# files
      },
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>tc", "<cmd>Coverage<cr>", desc = "Show Coverage" },
      { "<leader>tC", "<cmd>CoverageClear<cr>", desc = "Clear Coverage" },
    },
    opts = {
      auto_reload = true,
      lang = {
        cs = {
          coverage_file = vim.fn.getcwd() .. "/lcov.info",
        },
      },
    },
  },
}
