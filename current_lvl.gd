extends Node

var current_lvl = 0


func _ready():
	Events.connect("lvlstarted", self, "start_lvl_change")
#	Events.connect("lvlcomplete", self, "complete_lvl_change" )
	Events.connect("lvlcomplete", self, "complete_lvl_change", [], CONNECT_ONESHOT)


func complete_lvl_change(currentlvl):
	current_lvl += 1
	
	


var levelskeys = {
	"level1" : [3, 3, 3, 3, 3, 3],
	"level2" : [3, 3, 3, 5, 5, 5],
	"level3" : [1, 2, 1, 2, 4, 4, 5, 4, 5], 
	
}


var levelslist = {
	"level1" : "res://levels/lvl1.tscn",
	"level2" : "res://levels/lvl2.tscn",
	"level3" : "res://levels/lvl3.tscn",
	
	
}


var nextlevellist = {
	"level1" : "level2",
	"level2" : "level3",
	"level3" : "level4", 
	
	
	
	
	
	
	
}



