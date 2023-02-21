extends GridContainer

func _ready():
#	Events.connect("mouse_clicked_grid", self, "play_anima")
	Events.connect("picture_set", self, "check_cubes_for_anima")
#
#
#func check_cubes_for_anima(state, what_cube):
#	var status = state
#	var cube_numb = what_cube
##	print("place =", status)
##	print("cube=", cube_numb)
#
#	var used_child = get_child(what_cube)
#	used_child.play_anima(status)
