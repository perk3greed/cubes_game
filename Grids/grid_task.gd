extends GridContainer

onready var task_brik = preload("res://Grids/task_brick.tscn")
var lvlkey = preload("res://Bricks/disired_items_res.tres")




func _ready():
#	Events.connect("lvlstarted", self, "add_task_children")
	Events.connect("start_level_data", self, "add_task_children")


func add_task_children(level_data):
#	var this_level = lvlkey.levelskeys
	var this_level = level_data
#	var this_level_size = this_level[lvlcount]
	var this_level_size = level_data
##	var how_much_cubes = this_level_size.size()
#	var str_to_array = Array(level_data)
	var how_much_cubes = this_level.size()
	for cube in level_data:
		var instanced_brik = task_brik.instance()
		self.add_child(instanced_brik)
