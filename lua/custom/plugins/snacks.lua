return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  -- config = function()
  --   require('mini.sessions').setup()
  -- end,
  opts = {
    image = { enable = true },
    explorer = { enable = true },
    notifier = { enable = true },
    terminal = {
      win = {
        style = 'float',
        width = math.floor(vim.o.columns * 0.75),
        height = math.floor(vim.o.lines * 0.75),
      },
    },
    picker = {},
    dashboard = {
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        {
          pane = 2,
          icon = ' ',
          title = 'Git Status',
          section = 'terminal',
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = 'git status --short --branch --renames',
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = 'startup' },
      },
    },
  },
  keys = function()
    local focus_list = { focus = 'list' }
    local keys = {
      -- Top pickers & explorer
      {
        '<leader><space>',
        function()
          Snacks.picker.smart()
        end,
        desc = 'Smart Find Files',
      },
      {
        '<leader>:h',
        function()
          Snacks.picker.command_history(focus_list)
        end,
        desc = 'Command History',
      },
      {
        '<leader>:',
        function()
          Snacks.picker.commands()
        end,
        desc = 'Command',
      },
      {
        '<leader>n',
        function()
          Snacks.picker.notifications()
        end,
        desc = 'Notification History',
      },
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
      { '<leader>qq', '<cmd>qa<cr>', desc = 'Quit All' },
      -- Terminal
      {
        '<Leader><Enter>',
        function()
          Snacks.terminal.toggle()
        end,
        desc = 'Toggle a Terminal',
      },
      -- Buffer
      {
        '<leader>,',
        function()
          Snacks.picker.buffers(focus_list)
        end,
        desc = 'Buffers',
      },
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = 'Delete Buffer',
      },
      { '<leader><tab>', '<cmd>e #<cr>', desc = 'Switch to Other Buffer' },
      { '<C-s>', '<cmd>w <cr>', desc = 'Switch to Other Buffer' },
      { '<leader>fn', '<cmd>enew<cr>', desc = 'New File' },
      -- Git
      {
        '<leader>gs',
        function()
          Snacks.picker.git_status(focus_list)
        end,
        desc = 'Git Status',
      },
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log(focus_list)
        end,
        desc = 'Git Log',
      },
      {
        '<leader>gL',
        function()
          Snacks.picker.git_log_line(focus_list)
        end,
        desc = 'Git Log Line',
      },
      {
        '<leader>gf',
        function()
          Snacks.picker.git_log_file(focus_list)
        end,
        desc = 'Git Log File',
      },
      {
        '<leader>gd',
        function()
          Snacks.picker.git_diff(focus_list)
        end,
        desc = 'Git Diff (Hunks)',
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        { desc = 'Lazygit (cwd)' },
      },
      -- LSP
      {
        'gd',
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = 'Goto Definition',
      },
      {
        'gD',
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = 'Goto Declaration',
      },
      {
        'gr',
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = 'References',
      },
      {
        'gI',
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = 'Goto Implementation',
      },
      {
        'gy',
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = 'Goto T[y]pe Definition',
      },
      {
        'gai',
        function()
          Snacks.picker.lsp_incoming_calls()
        end,
        desc = 'C[a]lls Incoming',
      },
      {
        'gao',
        function()
          Snacks.picker.lsp_outgoing_calls()
        end,
        desc = 'C[a]lls Outgoing',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP Symbols',
      },
      {
        '<leader>sS',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP Workspace Symbols',
      },
      -- Grep
      {
        '<leader>sb',
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = 'Grep Open Buffers',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Grep',
      },
    }
    return keys
  end,
}
