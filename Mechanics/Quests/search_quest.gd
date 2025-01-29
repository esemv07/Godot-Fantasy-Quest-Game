class_name SearchQuest extends QuestManager


func start_quest() -> void:
	if (!GameManager.quest_active) and (quest_status == QuestStatus.available):
		GameManager.quest_active = true
		quest_status = QuestStatus.started
		QuestBox.visible = true
		QuestTitle.text = quest_name
		QuestDescription.text = quest_description


func reached_goal() -> void:
	if quest_status == QuestStatus.started:
		quest_status = QuestStatus.reached_goal
		QuestDescription.text = reached_goal_text
		JewelsCollected.visible = false
		JewelsLabel.visible = false


func finish_quest() -> void:
	if quest_status == QuestStatus.reached_goal:
		GameManager.quest_active = false
		quest_status = QuestStatus.finished
		QuestBox.visible = false
		GameManager.gems += gem_amount
		GameManager.xp += xp_amount


func lock_quest() -> void:
	if GameManager.quest_lock_show:
		QuestBox.visible = true
		QuestTitle.text = ""
		QuestDescription.text = ""
		QuestLock.visible = true
		QuestLock.text = locked_quest
	if GameManager.quest_lock_show == false:
		QuestLock.visible = false
		QuestBox.visible = false


func start_final_quest() -> void:
	if (!GameManager.quest_active) and (quest_status == QuestStatus.available):
		GameManager.quest_active = true
		quest_status = QuestStatus.started
		QuestBox.visible = true
		JewelsCollected.visible = true
		JewelsLabel.visible = true
		QuestTitle.text = quest_name
		QuestDescription.text = quest_description
