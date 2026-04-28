-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Paste without yanking the replaced text (allows multiple pastes)
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without yanking" })

-- Resize window using <ctrl> hjkl keys
vim.keymap.set("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Folding
vim.keymap.set("n", "<leader>zA", "zA", { desc = "Toggle fold recursively" })
vim.keymap.set("n", "<leader>zM", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "<leader>zR", "zR", { desc = "Open all folds" })

-- Test coverage
vim.keymap.set("n", "<leader>tG", function()
  vim.notify("Running coverage...", vim.log.levels.INFO)
  local output = {}
  vim.fn.jobstart(
    "dotnet test --coverage --coverage-output-format cobertura --coverage-output coverage.cobertura.xml && reportgenerator -reports:'coverage.cobertura.xml' -targetdir:'.' -reporttypes:lcov",
    {
      cwd = vim.fn.getcwd(),
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        vim.list_extend(output, data)
      end,
      on_stderr = function(_, data)
        vim.list_extend(output, data)
      end,
      on_exit = function(_, code)
        if code == 0 then
          vim.notify("Coverage generated!", vim.log.levels.INFO)
        else
          vim.notify("Coverage failed:\n" .. table.concat(output, "\n"), vim.log.levels.ERROR)
        end
      end,
    }
  )
end, { desc = "Generate Coverage" })
