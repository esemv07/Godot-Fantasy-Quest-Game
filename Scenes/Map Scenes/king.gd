extends Area2D

@export var quest: SearchQuest


func _on_body_entered(body: Node2D) -> void:
	if (!GameManager.quest_active) and (quest.quest_status == quest.QuestStatus.available):
		if (GameManager.xp >= 450) and (GameManager.gems >= 300):
			quest.start_final_quest()
			GameManager.quest_active = false
			$KingMapPortal.position = $"Portal Spawn Point".position
			$KingPortal.visible = true
		else:
			GameManager.quest_lock_show = true
			quest.lock_quest()
			$QuestLock.start()
		
	if quest.quest_status == quest.QuestStatus.reached_goal:
		quest.finish_quxest()
		$Completed.visible = true


func _on_quest_lock_timeout() -> void:
	GameManager.quest_lock_show = false
	quest.lock_quest()
