local function load_stylix_palette(filepath)
  local file = io.open(filepath, 'r')
  if not file then return nil end
  local content = file:read '*a'
  file:close()
  local palette, err = vim.json.decode(content)
  if err then
    vim.notify('Error parsing JSON from ' .. filepath .. ': ' .. err, vim.log.levels.ERROR)
    return nil
  end
  return palette
end

-- Try user config first, then fallback to system-wide
local stylix_colors = load_stylix_palette(vim.fn.expand '~/.config/stylix/palette.json')
  or load_stylix_palette('/etc/stylix/palette.json')

if not stylix_colors then
  vim.notify('Stylix palette not found in either location', vim.log.levels.WARN)
  return {}
end

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

