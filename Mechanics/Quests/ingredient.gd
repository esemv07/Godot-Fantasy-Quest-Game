extends Area2D

var quest: SearchQuest
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")


func _on_body_entered(body: Node2D) -> void:
	quest.reached_goal()
	queue_free()
