return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "Nsidorenco/neotest-vstest",
      -- Other Neotest dependencies like nvim-lua/plenary.nvim, etc.
    },
    opts = {
      adapters = {
        ["neotest-vstest"] = {
          -- Optional: Configure neotest-vstest specific options here
          -- For example:
          -- dotnet_additional_args = { "--runtime", "win-x64" },
        },
      },
      -- Other Neotest options
    },
  },
  -- You might also need to import the test.core extra if not already done
  { import = "lazyvim.plugins.extras.test.core" },
}
