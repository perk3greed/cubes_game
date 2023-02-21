extends TextureRect

onready var animas = get_node("AnimationPlayer")

var mouse_free = true
var mouseInside = false
export var whatcube = 0 
export var brickState = -1
export var desiredState = 0
var nocube = preload("res://Bricks/new_grid/wexler-cell.png")
var white = preload("res://Bricks/new_grid/wexler-full.png")
var first = preload("res://Bricks/new_grid/wexler-bl.png")
var second = preload("res://Bricks/new_grid/wexler-br.png")
var third = preload("res://Bricks/new_grid/wexler-tr.png")
var fourth = preload("res://Bricks/new_grid/wexler-tl.png")
var filled = preload("res://Bricks/new_grid/wexler-empty.png")
var texturesArray = [nocube, white, first, second, third, fourth, filled]


onready var animate = get_node("AnimationPlayer")


var childrenArray = []


signal mouse_clicked_grid(node)
signal picture_set(state, what_cube)


func _ready():
	set_texture(texturesArray[0])


func _process(delta):
#	Events.connect("lvlstarted", self, "set_starting_texture")
	if mouseInside:
		if mouse_free:
			if Input.is_action_just_pressed("LMB") or Input.is_action_just_released("LMB"):
				Events.emit_signal("mouse_clicked_grid", self)
				mouse_free = false
				set_texture(texturesArray[brickState+1])
				var current_anim = brickState+1
				var anima_number = str(current_anim)
				Events.emit_signal("animation_played", anima_number)
				animas.play(anima_number)
#			Events.emit_signal("picture_set", brickState, whatcube)

	if Input.is_action_just_released("LMB"):
		mouse_free = true




func set_disires(right_texture):
	desiredState = right_texture

func _on_TextureRect_mouse_entered():
	mouseInside = true

func _on_TextureRect_mouse_exited():
	mouseInside = false
