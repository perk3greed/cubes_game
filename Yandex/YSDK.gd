extends Node

var window = JavaScript.get_interface("window")
var returned_data = {}

var init_SDK_callback = JavaScript.create_callback(self, "init_SDK")
var get_player_callback = JavaScript.create_callback(self, "get_Player")
var get_mode_callback = JavaScript.create_callback(self, "get_Mode")
var set_data_callback = JavaScript.create_callback(self, "set_Data")
var get_data_callback = JavaScript.create_callback(self, "get_Data")

var ready_to_get_data = false
var first_get_callback = true
var starting_player_logged = false

func _ready() -> void:
#	window = JavaScript.get_interface("window")
	print("Initializing SDK...")
	window.initSDK(init_SDK_callback)
	
func init_SDK(args):
#	window = JavaScript.get_interface("window")
	print("init args from callback")
	print(args)
	if args[0] == true:
#		var ready_to_get_player = 1
		window.getPlayer(get_player_callback)

func get_Player(args):
#	window = JavaScript.get_interface("window")
	print("player args from callback")
	print(args)
	print(args[0])
	window.getMode(get_mode_callback)

func get_Mode(args):
	print("player mode args from callback")
	print(args)
	print(args[0])
	if args[0] != 'lite':
		starting_player_logged = true

func set_Data_js(dataToWrite):
#	window = JavaScript.get_interface("window")
	print("beginning data set from godot")
	window.setData(set_data_callback, dataToWrite)

func set_Data(args):
	print("set data args from callback")
	print(args)

func get_Data_js():
#	window = JavaScript.get_interface("window")
	print("beginning data get from godot")
	return window.getData(get_data_callback)

func get_Data(args):
	print("get data args from callback")
	print(args)
	returned_data = JSON.parse(args[0])
	if first_get_callback:
		first_get_callback = false
		return
	ready_to_get_data = true

func generate_ready_dict_in_string(td, cl):
	
	return '{"tutorial_done": ' + str(td).to_lower() + ', "current_level": ' + str(cl) + '}'
