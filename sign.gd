extends StaticBody2D

@export var sign_text = "none"

func _ready():
	get_node("Panel").hide()

func _on_area_2d_body_entered(body):
	if body.name == "CharacterBody2D":
		get_node("Panel/Label").text = sign_text
		get_node("Panel").show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		get_node("Panel").hide()
