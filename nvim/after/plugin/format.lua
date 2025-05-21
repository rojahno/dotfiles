vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local buf = args.buf
    local clients = vim.lsp.get_clients({ bufnr = buf })
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ bufnr = buf })
        return
      end
    end
  end,
})
