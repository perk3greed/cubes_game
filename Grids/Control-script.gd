extends Control

signal tutorial_ended
signal level_chosen(next_level)
signal delzone_mouse_enter()
signal delzone_mouse_exit()
signal next_button_pressed
var completenessArray = []
var current_lvl_count = ""
var current_lvl_data = []
#signal start_calculated(completenessArray)
#var desiredArray = []
#var startingArray = []
onready var animate_tutorial = get_node("Sprite/tutorial_animation")

var lvlkey = preload("res://Bricks/disired_items_res.tres")
var next_level = ""
var sound1 = preload("res://music/G4.mp3")
var sound2 = preload("res://music/A4.mp3")
var sound3 = preload("res://music/B4.mp3")
var sound4 = preload("res://music/C5.mp3")
var sound5 = preload("res://music/D5.mp3")
var sound6 = preload("res://music/E5.mp3")




func _ready():
#	Events.connect("lvlcomplete", self, "do_new_level")
	Events.connect("lvlstarted", self, "get_desires", [], CONNECT_DEFERRED )
	Events.connect("animation_played", self, "playsound")
	Events.connect("start_level_data", self, "set_level_data")
	Events.connect("play_tutorial", self, "play_tutorial_animation")
	Events.connect("mouse_clicked_grid", self, "end_tutorial")


func play_tutorial_animation():
	animate_tutorial.play("helping hand")
#	Events.emit_signal("tutorial_ended")

func end_tutorial():
	if animate_tutorial.is_playing == true:
		animate_tutorial.stop()
	


func set_level_data(level_data):
	current_lvl_data = level_data
	return current_lvl_data





func get_desires(lvlcount):
	var count = -1
	var count_pictures = -1
#	current_lvl_count = lvlcount
#	print(current_lvl_count)
#	var right_key = lvlkey.levelskeys[lvlcount]
	var right_key = current_lvl_data
	for gridblock in $grid_solution.get_children():
		count += 1 
		var right_texture = right_key[count]
		gridblock.set_disires(right_texture)
		gridblock.name = str(count)
	for gridpicture in $grid_task.get_children():
		count_pictures += 1 
		var right_task = right_key[count_pictures]
		gridpicture.create_task(right_task)


	for gridblock in $grid_solution.get_children():
		if gridblock.desiredState == gridblock.brickState:
			completenessArray.append(true)
		else:
			completenessArray.append(false)


func playsound(anima_number):
	var grid = anima_number
	if animate_tutorial.is_playing() == true:
		animate_tutorial.play("stop animation")
	if grid == "1":
		$AudioStreamPlayer.stream = sound1
	elif grid == "2":
		$AudioStreamPlayer.stream = sound2
	elif grid == "3":
		$AudioStreamPlayer.stream = sound3
	elif grid == "4":
		$AudioStreamPlayer.stream = sound4
	elif grid == "5":
		$AudioStreamPlayer.stream = sound5
		$AudioStreamPlayer.stream = sound5
	elif grid == "6":
		$AudioStreamPlayer.stream = sound6 
	$AudioStreamPlayer.play()





func _on_Control_mouse_entered():
	Events.emit_signal("delzone_mouse_enter")
	pass 


func _on_Control_mouse_exited():
	Events.emit_signal("delzone_mouse_exit")
	pass 

func _on_TextureButton_pressed():
#	get_tree().change_scene(next_level)
	Events.emit_signal("next_button_pressed")
