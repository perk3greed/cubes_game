extends Label

func _ready():
	self.text = "начать"
	if Ysdk.yandex_locale == "en":
		self.text = "begin"
	elif Ysdk.yandex_locale == "tr":
		self.text = "başla"
