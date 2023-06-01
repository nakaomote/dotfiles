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
    port = "38697",
    args = {}
  },
}

require("nvim-dap-virtual-text").setup {
     virt_text_pos = 'eol'
}
