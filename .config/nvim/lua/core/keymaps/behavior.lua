local map = require('core.keymaps._utils').map

-- Clear highlights on search with <Esc>.
map({ 'i', 'n' }, '<Esc>', '<cmd>noh<CR><Esc>')

