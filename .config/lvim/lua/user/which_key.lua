local kind = require('user.kind')

local wk = lvim.builtin.which_key

wk.mappings["m"] = {
  name = ' ' .. kind.todo_comments.PERF .. " HARPOON",
  m = {":lua require('harpoon.mark').add_file()<cr>", "Mark files"},
  t = {":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI"},
  a = {":lua require ('harpoon.ui').nav_file(1)<cr>", "Goto mark 1"},
  s = {":lua require ('harpoon.ui').nav_file(2)<cr>", "Goto mark 2"},
  d = {":lua require ('harpoon.ui').nav_file(3)<cr>", "Goto mark 3"},
  f = {":lua require ('harpoon.ui').nav_file(4)<cr>", "Goto mark 4"},
}

wk.mappings["X"] = {":wq<cr>", "Save file and quit"}
