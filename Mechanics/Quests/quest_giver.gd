extends Area2D

@export var quest: SearchQuest

var collectible := load("res://Mechanics/Quests/collectible.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if quest.quest_status == quest.QuestStatus.available:
			quest.start_quest()
			var new_collectible = collectible.instantiate()
			add_child(new_collectible)
			new_collectible.position = $"Collectible Spawn Point".position
			new_collectible.quest = quest
		
		if quest.quest_status == quest.QuestStatus.reached_goal:
			quest.finish_quest()
