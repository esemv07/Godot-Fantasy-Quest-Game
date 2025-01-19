extends Area2D


@export var target_area = ""
var area_path = "res://Scenes/Map Scenes/"

func _on_body_entered(body):
	if body is PlayerController:
		var full_path = area_path + target_area + ".tscn"
		get_tree().change_scene_to_file(full_path)
