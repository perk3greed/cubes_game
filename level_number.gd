extends Label

func _ready():
	Events.connect("level_label", self, "set_self_label")

func set_self_label(level_label):
	self.text = str("УРОВЕНЬ " + str(level_label))
	if Ysdk.yandex_locale == "en":
		self.text = str("LEVEL " + str(level_label))
	elif Ysdk.yandex_locale == "tr":
		self.text = str("SEV¡YE " + str(level_label))
