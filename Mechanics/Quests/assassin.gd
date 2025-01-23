extends Area2D

@export var quest: EnemyQuest

var Enemy := load("res://Scenes/Object Scenes/Enemy_Character.tscn")

func _on_body_entered(body: Node2D) -> void:
	if (!GameManager.quest_active) and (quest.quest_status == quest.QuestStatus.available):
		quest.start_quest()
		var new_enemy = Enemy.instantiate()
		add_child(new_enemy)
		new_enemy.position = $"Enemy Spawn Point".position
		new_enemy.quest = quest
	if quest.quest_status == quest.QuestStatus.reached_goal:
		quest.finish_quest()
		$Completed.visible = true
