class_name QuestManager extends Node

@onready var QuestBox: CanvasLayer = GameManager.get_node("Quest Box")
@onready var QuestTitle: RichTextLabel = GameManager.get_node("Quest Box").get_node("Quest Title")
@onready var QuestDescription: RichTextLabel = GameManager.get_node("Quest Box").get_node("Quest Description")

@export_group("Quest Settings")
@export var quest_name: String
@export var quest_description: String
@export var reached_goal_text: String

enum QuestStatus{
	available,
	started,
	reached_goal,
	finished,
}
 
@export var quest_status: QuestStatus = QuestStatus.available

@export_group("Reward Settings")
@export var gem_amount: int
@export var xp_amount: int
