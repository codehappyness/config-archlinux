if true then return {} end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        phpactor = {
          filetypes = { "php" },
          root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
        },
      },
    },
  },
}
