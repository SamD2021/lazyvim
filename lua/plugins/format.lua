return {
  'stevearc/conform.nvim',
  enabled = require('nixCatsUtils').lazyAdd(true, false),
  opts = {
    formatters_by_ft = {
      nix = { 'nixfmt' },
      rust = { 'rustfmt' },
    },
  },
}
