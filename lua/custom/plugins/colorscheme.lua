return {
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('vscode').setup {
        transparent = false,
        italic_comments = true,
      }
      vim.cmd 'colorscheme vscode'
    end,
  },
  {
    'folke/tokyonight.nvim',
    enable = false,
  },
}
