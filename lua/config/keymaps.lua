local mapkey = require("util.keymapper").mapkey

-- Navegación de Buffers
mapkey("<leader>bn", "bnext", "n") -- Siguiente buffer (espacio + bn)
mapkey("<leader>bp", "bprevious", "n") -- Buffer anterior (espacio + bp)
mapkey("<leader>bb", "e #", "n") -- Cambiar al otro buffer (espacio + bb)
mapkey("<leader>`", "e #", "n") -- Cambiar al otro buffer (espacio + `)

-- Navegación de Directorios
mapkey("<leader>m", "NvimTreeFocus", "n") -- Enfocar el árbol de directorios (espacio + m)
mapkey("<leader>e", "NvimTreeToggle", "n") -- Alternar el árbol de directorios (espacio + e)

-- Navegación de Paneles y Ventanas
mapkey("<C-h>", "<C-w>h", "n") -- Navegar a la izquierda (Ctrl + h)
mapkey("<C-j>", "<C-w>j", "n") -- Navegar hacia abajo (Ctrl + j)
mapkey("<C-k>", "<C-w>k", "n") -- Navegar hacia arriba (Ctrl + k)
mapkey("<C-l>", "<C-w>l", "n") -- Navegar a la derecha (Ctrl + l)
mapkey("<C-h>", "wincmd h", "t") -- Navegar a la izquierda en terminal (Ctrl + h)
mapkey("<C-j>", "wincmd j", "t") -- Navegar hacia abajo en terminal (Ctrl + j)
mapkey("<C-k>", "wincmd k", "t") -- Navegar hacia arriba en terminal (Ctrl + k)
mapkey("<C-l>", "wincmd l", "t") -- Navegar a la derecha en terminal (Ctrl + l)
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navegar a la izquierda en tmux (Ctrl + h)
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navegar hacia abajo en tmux (Ctrl + j)
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navegar hacia arriba en tmux (Ctrl + k)
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navegar a la derecha en tmux (Ctrl + l)

-- Gestión de Ventanas
mapkey("<leader>sv", "vsplit", "n") -- Dividir verticalmente (espacio + sv)
mapkey("<leader>sh", "split", "n") -- Dividir horizontalmente (espacio + sh)
mapkey("<C-Up>", "resize +2", "n") -- Aumentar el tamaño de la ventana (arriba) (Ctrl + flecha arriba)
mapkey("<C-Down>", "resize -2", "n") -- Disminuir el tamaño de la ventana (abajo) (Ctrl + flecha abajo)
mapkey("<C-Left>", "vertical resize +2", "n") -- Aumentar el tamaño verticalmente (izquierda) (Ctrl + flecha izquierda)
mapkey("<C-Right>", "vertical resize -2", "n") -- Disminuir el tamaño verticalmente (derecha) (Ctrl + flecha derecha)

-- Mostrar la Ruta Completa del Archivo
mapkey("<leader>pa", "ShowPath", "n") -- Mostrar la ruta completa del archivo (espacio + pa)

-- Sangría (Indentación)
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true }) -- Deshacer sangría y mantener selección (< en modo visual)
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true }) -- Hacer sangría y mantener selección (> en modo visual)

local api = vim.api

-- Comentarios
if vim.env.TMUX ~= nil then
	api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false }) -- Comentario en modo normal (Ctrl + _ en tmux)
	api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false }) -- Comentario en modo visual (Ctrl + _ en tmux)
else
	api.nvim_set_keymap("n", "<C-/>", "gtc", { noremap = false }) -- Comentario en modo normal (Ctrl + / fuera de tmux)
	api.nvim_set_keymap("v", "<C-/>", "goc", { noremap = false }) -- Comentario en modo visual (Ctrl + / fuera de tmux)
end
