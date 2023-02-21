extends Node

signal mouse_clicked_grid(node)
signal mouse_clicked_menu(node)

#signal start_calculated(completenessArray)

signal delzone_mouse_enter()
signal delzone_mouse_exit()

signal lvlstarted(lvlcount)
signal lvlcomplete(currentlvl)
signal level_chosen(next_level)

signal start_button_pressed

signal start_level_data(level_data)
signal next_button_pressed
signal level_label(label_data)


signal sound_control_pressed(button_pressed)

signal play_tutorial
signal tutorial_ended

signal picture_set(state, what_cube)

signal animation_played(anima_number)

signal unmute_sounds
signal mute_sounds

#func _ready():
#	Events.connect("mute_sounds", self, "sound_muted")
#	Events.connect("unmute_sounds", self, "sound_unmuted")

var sound_state = true

#
#func sound_muted():
#	sound_state = false
#
#func sound_unmuted():
#	sound_state = true
