extends Label



func _ready():
	Events.connect("play_tutorial", self, "make_self_visible_for_tutorial")
	
	


func make_self_visible_for_tutorial():
	self.visible = true
