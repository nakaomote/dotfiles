require('dap-go').setup {
  dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  delve = {
    path = "dlv",
    initialize_timeout_sec = 2000,
    port = "${port}",
    args = {}
  },
}

require("nvim-dap-virtual-text").setup {
     virt_text_pos = 'eol'
}

require("dapui").setup({
  icons = {
    expanded = "⯆",
    collapsed = "⯈",
    circular = "↺"
  },
  mappings = {
    expand = "<CR>",
    open = "o",
    remove = "d"
  },
  sidebar = {
    elements = {
      -- You can change the order of elements in the sidebar
      "scopes",
      "scopes",
      "watches"
    },
    width = 40,
    position = "left" -- Can be "left" or "right"
  },
  tray = {
    elements = {
      "repl"
    },
    height = 10,
    position = "bottom" -- Can be "bottom" or "top"
  }
})
