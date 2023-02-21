extends Node2D

var white = preload("res://Bricks/new_grid/wexler-full.png")
var first = preload("res://Bricks/new_grid/wexler-bl.png")
var second = preload("res://Bricks/new_grid/wexler-br.png")
var third = preload("res://Bricks/new_grid/wexler-tr.png")
var fourth = preload("res://Bricks/new_grid/wexler-tl.png")
var filled = preload("res://Bricks/new_grid/wexler-empty.png")
var texturesArray = [white, first, second, third, fourth, filled]
# -1 is for no cube
# 0 is for white cube
# 1 is for first quadrant, tr
# 2 is for second quadrant, tl
# 3 is for third quadrant, bl
# 4 is for fourth quadrant, br
# 5 is for color cube
var lvlkeylist = preload("res://Bricks/disired_items_res.tres")


signal lvlcomplete 

var mouseState = -1
var destructionState = false
var currentlvl = ""
#var seenComplete = [false, false, false, false, false, false]
var seenComplete
var winCond = true

func _ready():
#	Events.connect("start_calculated", self, "_on_Control_start_calculated")
	Events.connect("lvlstarted", self, "check_lvl_count")
	Events.connect("mouse_clicked_grid", self, "_on_GridBlock_mouse_clicked_grid")
	Events.connect("mouse_clicked_menu", self, "_on_MenuBlock_mouse_clicked_menu")
	Events.connect("delzone_mouse_enter", self, "_on_Control_mouse_entered")
	Events.connect("delzone_mouse_exit", self, "_on_Control_mouse_exited")
	Events.connect("start_level_data", self, "reset_all_shit")
#	seenComplete = get_tree().get_nodes_in_group("controlGroup")[0].completenessArray


func reset_all_shit(level_data):
	seenComplete = get_tree().get_nodes_in_group("controlGroup")[0].completenessArray
#	print(level_data, "array reset")

func _process(delta):
	position = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("LMB"):
		if destructionState:
			mouseState = -1
			$MouseRectTexture.texture = null
	for pieceState in seenComplete:
		if not pieceState:
			winCond = false
			break
		winCond = true
	if winCond:
		Events.emit_signal("lvlcomplete", currentlvl)

func check_lvl_count(lvlcount):
	currentlvl = lvlcount

func _on_GridBlock_mouse_clicked_grid(blockNode):
	var oldTextureId = blockNode.brickState
	if blockNode.brickState == mouseState:
		return
	blockNode.brickState = mouseState
	if seenComplete[index_converter(blockNode.name)]:
		seenComplete[index_converter(blockNode.name)] = false
	elif blockNode.desiredState == blockNode.brickState:
		seenComplete[index_converter(blockNode.name)] = true
	mouseState = oldTextureId
	if mouseState >= 0:
		$MouseRectTexture.texture = texturesArray[mouseState]
		
	else:
		$MouseRectTexture.texture = null
		$boom.emitting = true
	

func _on_MenuBlock_mouse_clicked_menu(blockNode):
	mouseState = blockNode.brickState
	$MouseRectTexture.texture = texturesArray[mouseState]


func _on_Control_mouse_entered():
	destructionState = true
	pass # Replace with function body.


func _on_Control_mouse_exited():
#	print("mouse left element")
	destructionState = false
	pass # Replace with function body.




func index_converter(strindex):
#	print(strindex)
	if strindex[-1] == "k":
		return 0
	else:
		return int(strindex[-1])-1
