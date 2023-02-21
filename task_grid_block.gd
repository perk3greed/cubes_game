extends TextureRect

export var this_cube_is = 0 




var nocube = preload("res://Bricks/new_grid/wexler-cell.png")
var white = preload("res://Bricks/new_grid/wexler-full.png")
var first = preload("res://Bricks/new_grid/wexler-bl.png")
var second = preload("res://Bricks/new_grid/wexler-br.png")
var third = preload("res://Bricks/new_grid/wexler-tr.png")
var fourth = preload("res://Bricks/new_grid/wexler-tl.png")
var filled = preload("res://Bricks/new_grid/wexler-empty.png")
var texturesArray = [nocube, white, first, second, third, fourth, filled]

var lvlkey = preload("res://Bricks/disired_items_res.tres")

func _ready():
	Events.connect("start_level_data", self, "create_task")
##	Events.connect("lvlstarted", self, "get_desires")
#	var current_texture = lvlkey.levelskeys[this_cube_is]
#	var current_current_texture = texturesArray[current_texture] 
#	set_texture(current_current_texture)
	
	
func create_task(level_data):
	var current_current_texture = texturesArray[level_data+1] 
	set_texture(current_current_texture)
	



