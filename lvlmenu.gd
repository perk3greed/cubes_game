extends TextureButton

export var lvlask = ""

var lvlchart = preload ("res://Bricks/disired_items_res.tres")

#var currentlvl = lvlchart.levelslist[lvlask]

func _on_TextureButton_pressed():
	var currentlvl = lvlchart.levelslist[lvlask]
	get_tree().change_scene(currentlvl)
