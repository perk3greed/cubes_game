extends Node2D

signal lvlstarted(lvlcount)

func _ready():
	JavaScript.eval("ysdk.adv.showFullscreenAdv({callbacks:{}});")
	Events.emit_signal("lvlstarted", "level1")
