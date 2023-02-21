extends GridContainer


onready var solution_brik = preload("res://Grids/Grid-Block.tscn")
var lvlkey = preload("res://Bricks/disired_items_res.tres")




func _ready():
#	Events.connect("lvlstarted", self, "add_solution_children")
	Events.connect("start_level_data", self, "add_solution_children")


func add_solution_children(lvlcount):
#	var this_level = lvlkey.levelskeys
	var this_level = lvlcount
#	var this_level_size = this_level[lvlcount]
	var this_level_size = lvlcount
	var how_much_cubes = this_level_size.size()
	for cube in how_much_cubes:
		var instanced_brik = solution_brik.instance()
		self.add_child(instanced_brik)
