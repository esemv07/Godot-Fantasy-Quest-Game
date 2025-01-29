extends Area2D

@export var quest: SearchQuest

var ingredient := load("res://Mechanics/Quests/ingredient.tscn")

func _on_body_entered(body: Node2D) -> void:
	if (!GameManager.quest_active) and (quest.quest_status == quest.QuestStatus.available):
		quest.start_quest()
		var new_ingredient = ingredient.instantiate()
		add_child(new_ingredient)
		new_ingredient.position = $"Ingredient Spawn Point".position
		new_ingredient.quest = quest
		
	if quest.quest_status == quest.QuestStatus.reached_goal:
		quest.finish_quest()
		$Completed.visible = true
