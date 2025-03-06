-- -- Load the JSON library
-- Function to read and parse the JSON file
local function load_stylix_palette(filepath)
  local file = io.open(filepath, 'r')
  if not file then
    vim.notify('Failed to open ' .. filepath, vim.log.levels.ERROR)
    return nil
  end
  local content = file:read '*a'
  file:close()
  local palette, err = vim.json.decode(content)
  if err then
    vim.notify('Error parsing JSON: ' .. err, vim.log.levels.ERROR)
    return nil
  end
  return palette
end

-- Load the Stylix palette
local stylix_colors = load_stylix_palette '/etc/stylix/palette.json'
-- local base16 = require('base16-colorscheme').setup {
--   base00 = '#' .. stylix_colors.base00,
--   base01 = '#' .. stylix_colors.base01,
--   base02 = '#' .. stylix_colors.base02,
--   base03 = '#' .. stylix_colors.base03,
--   base04 = '#' .. stylix_colors.base04,
--   base05 = '#' .. stylix_colors.base05,
--   base06 = '#' .. stylix_colors.base06,
--   base07 = '#' .. stylix_colors.base07,
--   base08 = '#' .. stylix_colors.base08,
--   base09 = '#' .. stylix_colors.base09,
--   base0a = '#' .. stylix_colors.base0a,
--   base0b = '#' .. stylix_colors.base0b,
--   base0c = '#' .. stylix_colors.base0c,
--   base0d = '#' .. stylix_colors.base0d,
--   base0E = '#' .. stylix_colors.base0E,
--   base0F = '#' .. stylix_colors.base0F,
--   vim.cmd.highlight { 'Normal', 'guibg=NONE', 'ctermbg=NONE' },
--   vim.cmd.highlight { 'NonText', 'guibg=NONE', 'ctermbg=NONE' },
-- }

-- Configure LazyVim to load gruvbox
return {
  {
    'echasnovski/mini.base16',
    opts = {
      palette = {
        base00 = '#' .. stylix_colors.base00,
        base01 = '#' .. stylix_colors.base01,
        base02 = '#' .. stylix_colors.base02,
        base03 = '#' .. stylix_colors.base03,
        base04 = '#' .. stylix_colors.base04,
        base05 = '#' .. stylix_colors.base05,
        base06 = '#' .. stylix_colors.base06,
        base07 = '#' .. stylix_colors.base07,
        base08 = '#' .. stylix_colors.base08,
        base09 = '#' .. stylix_colors.base09,
        base0A = '#' .. stylix_colors.base0A,
        base0B = '#' .. stylix_colors.base0B,
        base0C = '#' .. stylix_colors.base0C,
        base0D = '#' .. stylix_colors.base0D,
        base0E = '#' .. stylix_colors.base0E,
        base0F = '#' .. stylix_colors.base0F,
      },
    },
  },
  {
    'LazyVim/LazyVim',
    opts = {
      -- colorscheme = 'base16-colors',
    },
  },
}
