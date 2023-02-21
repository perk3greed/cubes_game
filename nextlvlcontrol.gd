extends Control

var lvlkeylist = preload("res://Bricks/disired_items_res.tres")

var nexlvl = ""
var particles_emitted = false
var button_pressed = false 
var particle_times = 0

func _ready():
	self.visible = false
	Events.connect("lvlcomplete", self, "appear_my_child", [], CONNECT_ONESHOT )
	Events.connect("lvlstarted", self, "chose_lvl")
	Events.connect("level_chosen", self, "get_sturdy")
	
	
	
func appear_my_child(somedumbstuff):
	self.visible = true
	$win_sound.play()
	if particles_emitted == false:
		$win_particles.emitting = true
		particle_times +=1
		if particle_times == 60:
			particles_emitted = true


func get_sturdy(next_level):
	if button_pressed == true:
		get_tree().change_scene(next_level)


func _on_TextureButton_pressed():
	button_pressed = true 
