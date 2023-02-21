extends TextureRect


var mouseInside = false
export var brickState = -1
var nocube = preload("res://Bricks/new_grid/wexler-cell.png")
var white = preload("res://Bricks/new_grid/wexler-full.png")
var first = preload("res://Bricks/new_grid/wexler-bl.png")
var second = preload("res://Bricks/new_grid/wexler-br.png")
var third = preload("res://Bricks/new_grid/wexler-tr.png")
var fourth = preload("res://Bricks/new_grid/wexler-tl.png")
var filled = preload("res://Bricks/new_grid/wexler-empty.png")
var texturesArray = [nocube, white, first, second, third, fourth, filled]
# -1 is for no cube
# 0 is for white cube
# 1 is for first quadrant, tr
# 2 is for second quadrant, tl
# 3 is for third quadrant, bl
# 4 is for fourth quadrant, br
# 5 is for color cube

signal mouse_clicked_menu(node)

func _ready():
	set_texture(texturesArray[brickState+1])


func _process(delta):
	if mouseInside:
		if Input.is_action_just_pressed("LMB"):
			Events.emit_signal("mouse_clicked_menu", self)
			$take_animation.play("animation_taken")
#			set_texture(texturesArray[brickState+1])

func _on_TextureRect_mouse_entered():
	mouseInside = true

func _on_TextureRect_mouse_exited():
	mouseInside = false
