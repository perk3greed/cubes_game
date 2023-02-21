extends TextureRect

var is_mouse_inside = false

onready var anima = get_node("AnimationPlayer")
#
#func _ready():
#	Events.connect("mouse_clicked_grid", self, "play_anima")


#func _process(delta):
#	if is_mouse_inside:
#		if Input.is_action_just_pressed("LMB"):
##			anima.play("full_block_entered")
#
#func play_anima(status):
#	var animate = str(status)
#	print(animate)
#	anima.play(animate)


func _on_AnimaTextRect_mouse_entered():
	is_mouse_inside = true

func _on_AnimaTextRect_mouse_exited():
	is_mouse_inside = false
