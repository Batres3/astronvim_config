-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["J"] = { "mzJ`z", desc = "Normal J but cursor stays at same spot" },
    ["<C-d>"] = { "<C-d>zz", desc = "Move down while cursor stays in the middle of the screen"},
    ["<C-u>"] = { "<C-u>zz", desc = "Move up while cursor stays in the middle of the screen" },
    ["n"] = { "nzzzv", desc = "When cycling through selections cursor stays in the middle of the screen"},
    ["N"] = { "Nzzzv", desc = "When cycling through selections cursor stays in the middle of the screen" },
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Find and replace current word" },
    ["<leader>rr"] = { ":MagmaEvaluateLine<CR>" , desc = "Evaluate the current line"},
    ["<leader>rc"] = { ":MagmaReevaluateLine<CR>" , desc = "Evaluate the current cell"},
    ["<leader>rd"] = { ":MagmaDelete<CR>" , desc = "Delete the current cell"},
    ["<leader>ro"] = { ":MagmaShowOutput<CR>" , desc = "Show output of current cell"},
    ["<leader>rq"] = { ":noautocmd MagmaEnterOutput<CR>" , desc = "Enter output window"},
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>r"] = { name = "Run Code"},
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move selection down" },
    ["<leader>d"] = { "\"_d", desc = "Delete into void register"},
  },
  x = {
    ["<leader>p"] = { "\"_dP", desc = "Paste selection into void register"},
    ["<leader>r"] = { ":<C-u>MagmaEvaluateVisual<CR>" , desc = "Evaluate the current selection"},
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
