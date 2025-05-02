require("theprimeagen")

-- hello fem

vim.api.nvim_create_user_command("LoadSrcs", function()
  vim.cmd("args **/src/**/*.c")
  vim.cmd("argdo edit")
end, {})


vim.api.nvim_create_user_command("CheckLspClients", function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })

  if #clients == 0 then
    print("No LSP clients attached to this buffer.")
    return
  end

  print("Attached LSP Clients:")
  local encodings = {}
  for _, client in ipairs(clients) do
    local encoding = client.offset_encoding or (client.server_capabilities and client.server_capabilities.offsetEncoding)
    encoding = type(encoding) == "table" and encoding[1] or encoding or "unknown"
    print(string.format("  - %s (offset_encoding: %s)", client.name, encoding))
    table.insert(encodings, encoding)
  end

  -- Check for encoding mismatch
  local first = encodings[1]
  for _, enc in ipairs(encodings) do
    if enc ~= first then
      vim.api.nvim_echo({ { "⚠️ Warning: Mismatched offset_encodings detected!", "WarningMsg" } }, false, {})
      return
    end
  end

  print("✅ All LSP clients use the same encoding.")
end, {})

