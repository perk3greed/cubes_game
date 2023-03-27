extends Label

func _ready():
	self.text = "Следующий\nуровень"
	if Ysdk.yandex_locale == "en":
		self.text = "Next\nlevel"
	elif Ysdk.yandex_locale == "tr":
		self.text = "Sonrak¡\nsev¡ye"
