extends TextureRect


func _ready():
	var animation = $AnimationPlayer
	animation.play("spawn_animation")
