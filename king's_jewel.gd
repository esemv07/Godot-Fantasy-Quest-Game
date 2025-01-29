extends Area2D

@export var quest: SearchQuest

func _on_body_entered(body: Node2D) -> void:
	GameManager.jewel_collected += 1
	if GameManager.jewel_collected == 5:
		quest.reached_goal()
		$"../EndMapPortal".position = $"../Portal Spawn Point".position
		$"../KingPortal".visible = true
	remove_child($Gemstone1)
	remove_child($CollisionShape2D)
