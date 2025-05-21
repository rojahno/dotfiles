return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<leader>b",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffers"
    },
    {
      "<leader>s",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Search"
    },
    {
      "<leader>g",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Git"
    },

    {
      "<leader>f",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Files"
    },
    {
      "<leader>c",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Code"
    },
    {
      "<leader>w",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Window"
    }
  },
}
