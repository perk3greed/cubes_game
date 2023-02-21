extends Node2D

signal lvlstarted(lvlcount)


func _ready():
	Events.emit_signal("lvlstarted", "level1")

