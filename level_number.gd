extends Label

func _ready():
	Events.connect("level_label", self, "set_self_label")
	
	


func set_self_label(level_label):
	self.text = str("УРОВЕНЬ " + str(level_label))
