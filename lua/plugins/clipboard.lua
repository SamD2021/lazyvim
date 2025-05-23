return {
  'ojroques/nvim-osc52',
  config = function()
    require('osc52').setup {
      max_length = 0,
      silent = false,
      trim = false,
    }

    vim.keymap.set('n', 'y', function()
      if vim.v.operator == 'y' then
        require('osc52').copy_register '+'
      end
    end, { expr = true })

    vim.keymap.set('v', 'y', function()
      require('osc52').copy_visual()
    end, {})
  end,
}
