extends Label

func _ready():
	self.text = "РАССТАВЛЯЙ КВАДРАТИКИ\n КАК НА КАРТИНКЕ СЛЕВА!"
	if Ysdk.yandex_locale == "en":
		self.text = "ARRANGE THE PIECES\nTO RECREATE THE PICTURE ON THE LEFT"
	elif Ysdk.yandex_locale == "tr":
		self.text = "SOLDAK¡ RESM¡ YEN¡DEN OLUŞTURMAK\n¡Ç¡N PARÇALARI DÜZENLEY¡N"
