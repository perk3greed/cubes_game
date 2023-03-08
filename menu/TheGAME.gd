extends Node2D

var current_level
var tutorial_done
var rng = RandomNumberGenerator.new()

signal start_level_data(level_data)
signal play_tutorial
signal mute_sounds 
signal unmute_sounds

var master_sound = AudioServer.get_bus_index("Master")

onready var levels_listed = "res://Bricks/desired_items.gd"
var scene = preload("res://levels/lvl1.tscn")
var menu_scene = preload("res://Bricks/animated textures/start_menu.tscn")

var lvls = {
	1 : [2, 1], 
	2 : [0, 5, 0, 0, 5, 0],
	3 : [1, 5, 0, 4, 5, 0],
	4 : [0, 1, 2, 0, 1, 2],
	5 : [4, 2, 0, 1, 2, 0],
	6 : [3, 1, 5, 1, 3, 0],
	7 : [0, 3, 2, 5, 0, 5, 4, 1, 0],
	8 : [3, 5, 4, 4, 0, 3, 0, 5, 0], 
	9 : [2, 3, 1, 2, 4, 4, 5, 4, 5],
	10 : [3, 0, 4, 5, 0, 5, 4, 5, 1],
	11 : [3, 2, 5, 0, 5, 0, 2, 3, 5],
	12 : [1, 5, 2, 0, 5, 0, 4, 5, 3], 
	13 : [4, 2, 1, 2, 0, 4, 3, 4, 2],
	14 : [5, 4, 5, 4, 5, 5, 5, 4, 0],
	15 : [5, 2, 0, 2, 0, 4, 0, 4, 5], 
	16 : [4, 3, 4, 1, 2, 1, 4, 3, 4],
	17 : [5, 0, 5, 3, 1, 3, 0, 5, 0],
	18 : [4, 1, 2, 3, 4, 1, 2, 3, 4],
	19 : [5, 4, 1, 4, 3, 5, 1, 0, 4],
	20 : [1, 5, 5, 0, 1, 5, 0, 0, 1], 
	21 : [4, 5, 5, 1, 3, 5, 0, 1, 2],
	22 : [4, 1, 4, 3, 2, 3, 4, 1, 4],  
	23 : [5, 5, 2, 1, 5, 3, 0, 1, 5],
	24 : [2, 1, 5, 3, 4, 2, 5, 2, 0],
	25 : [1, 2, 1, 3, 4, 3, 5, 5, 5],
	26 : [4, 3, 3, 2, 1, 2, 4, 3, 4], 
	27 : [4, 2, 4, 2, 4, 2, 4, 2, 4],
	28 : [2, 1, 3, 4, 3, 1, 1, 2, 4],
	29 : [2, 3, 5, 2, 0, 4, 5, 4, 4],
	30 : [4, 3, 4, 1, 4, 1, 4, 3, 0],
	31 : [3, 1, 3, 2, 4, 2, 4, 2, 4],  
	
}

func _notification(what):
	match what:
		MainLoop.NOTIFICATION_WM_FOCUS_OUT:
			pass
		MainLoop.NOTIFICATION_WM_FOCUS_IN:
			pass

func _ready():
	Events.connect("sound_control_pressed", self, "sound_change")
	Events.connect("start_button_pressed", self, "change_children")
	Events.connect("next_button_pressed", self, "go_back_to_menu")
	JavaScript.eval("console.log('_ready() moment')")

func level_setter_ysdk():
	print("tutorial done?")
	tutorial_done = bool(Ysdk.returned_data.result["tutorial_done"])
	print(tutorial_done)
	print("current level?")
	current_level = int(Ysdk.returned_data.result["current_level"])
	print(current_level)

func level_setter_local():
	print("tutorial done?")
	tutorial_done = bool(Ysdk.local_returned_data.result["tutorial_done"])
	print(tutorial_done)
	print("current level?")
	current_level = int(Ysdk.local_returned_data.result["current_level"])
	print(current_level)

var ft = true
var localft = true

func _process(delta):
	if localft:
		localft = false
		Ysdk.local_get_Data_js()
		print("print local from process, ", Ysdk.local_returned_data.result)
		level_setter_local()
	if ft and Ysdk.yandex_is_connected and Ysdk.starting_player_logged:
		Events.disconnect("start_button_pressed", self, "change_children")
		Ysdk.get_Data_js()
		if Ysdk.ready_to_get_data:
			print("print yandex from process, ", Ysdk.returned_data.result)
			level_setter_ysdk()
			ft = false
			Events.connect("start_button_pressed", self, "change_children")
	pass

func change_children():
	print("changing children...")
	if tutorial_done == null and current_level == null:
		tutorial_done = false
		current_level = 1
	Ysdk.local_set_Data_js(Ysdk.generate_ready_dict_in_string(tutorial_done, current_level))
	if Ysdk.yandex_is_connected and Ysdk.starting_player_logged:
		Ysdk.set_Data_js(Ysdk.generate_ready_dict_in_string(tutorial_done, current_level))
	$button_pressed.play()
	if current_level <= 31: 
		var instanced_child = scene.instance()
		var level_data = lvls[current_level]
		var label_data = current_level
		self.remove_child($Control2)
		self.add_child(instanced_child)
		Events.emit_signal("start_level_data", level_data)
		Events.emit_signal("level_label", label_data)
		current_level += 1
	else:
		var instanced_child = scene.instance()
		var level_data = []
		for i in range(0, 9, 1): 
			rng.randomize()
			var random_number = rng.randi_range(0, 5)
			level_data.append(random_number)
#		var level_data = []
		var label_data = current_level
		self.remove_child($Control2)
		self.add_child(instanced_child)
		Events.emit_signal("start_level_data", level_data)
		Events.emit_signal("level_label", label_data)
		current_level += 1
	if tutorial_done == false:
		Events.emit_signal("play_tutorial")
		tutorial_done = true
	

func go_back_to_menu():
	$button_pressed.play()
	var instanced_menu = menu_scene.instance()
#	var back_to_menu = scene.instance()
	self.add_child(instanced_menu)
	get_node("lvl1root").queue_free()
	
func sound_change(button_pressed):
	if button_pressed == true:
		AudioServer.set_bus_mute(master_sound, true)
		Events.sound_state = false

	if button_pressed == false:
		AudioServer.set_bus_mute(master_sound, false)
		Events.sound_state = true
