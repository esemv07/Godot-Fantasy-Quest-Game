extends Area2D
class_name InteractionArea

@export var action_name = "interact"

var interact: Callable = func():
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_area_entered(area: Area2D) -> void:
	print("it workssss")
