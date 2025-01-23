extends Area2D

var quest: SearchQuest

func _on_body_entered(body: Node2D) -> void:
	quest.reached_goal()
	queue_free()
