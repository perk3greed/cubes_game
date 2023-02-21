extends TextureButton

signal start_button_pressed

onready var current_level_autoload = get_node("/root/CurrentLvl")
var levels_complete = 0 

func _on_TextureButton_pressed():
	var change = current_level_autoload.current_lvl
#	print(change)
	Events.emit_signal("start_button_pressed")
	
#	get_tree().change_scene("res://menu/lvlmenu.tscn")


func count_levels():
	levels_complete += 1
