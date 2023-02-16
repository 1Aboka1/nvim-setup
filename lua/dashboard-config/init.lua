vim.g.dashboard_default_executive = 'telescope'
local db = require('dashboard')
local home = os.getenv('HOME')

db.preview_command = 'ueberzug'
db.preview_file_path = home .. '/.config/nvim/static/01.png'
db.image_width_pixel = 8
db.image_height_pixel = 10
db.preview_file_height = 12
db.preview_file_width = 30
db.header_pad = 0
db.center_pad = 5

db.custom_center = {
    {icon = '  ',
	desc ='File Browser',
	action =  'NvimTreeToggle'},
    {icon = '  ',
        desc = 'Find File',
        action = 'Telescope find_files find_command=rg,--hidden,--files'},
    {icon = '  ',
        desc = 'Find word',
        action = 'Telescope live_grep'},
    {icon = '  ',
        desc = 'Open dotfiles',
        action = 'Telescope dotfiles path=' .. home ..'/.config'},
}
