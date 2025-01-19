extends Node

var gems = 50
var xp = 1000

func _process(delta: float) -> void:
	$"CanvasLayer/XP Count".text = str(xp)
	$"CanvasLayer/Gem Count".text = str(gems)
