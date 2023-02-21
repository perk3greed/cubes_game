extends TextureButton

signal sound_control_pressed(button_pressed)

#onready var sound_check = "res://Src/Events.gd"

func _ready():
	if Events.sound_state == false:
#	if AudioServer.set_bus_mute:
		self.set_pressed_no_signal(true)


func _on_TextureButton_toggled(button_pressed):
	Events.emit_signal("sound_control_pressed", (button_pressed))
