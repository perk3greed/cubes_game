extends Resource

class_name levels


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


var levelsforcycle = ["res://levels/lvl1.tscn",
"res://levels/lvl2.tscn",
"res://levels/lvl3.tscn",]
