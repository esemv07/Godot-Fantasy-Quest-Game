class_name QuestManager extends Node

@onready var QuestBox: CanvasLayer = GameManager.get_node("Quest Box")
@onready var QuestTitle: RichTextLabel = GameManager.get_node("Quest Box").get_node("Quest Title")
@onready var QuestDescription: RichTextLabel = GameManager.get_node("Quest Box").get_node("Quest Description")
@onready var QuestLock: RichTextLabel = GameManager.get_node("Quest Box").get_node("Quest Lock")
@onready var JewelsCollected: RichTextLabel = GameManager.get_node("Quest Box").get_node("Jewels Collected")
@onready var JewelsLabel: RichTextLabel = GameManager.get_node("Quest Box").get_node("Jewels Label")
@onready var YouWin: RichTextLabel = GameManager.get_node("CanvasLayer").get_node("You Win")

@export_group("Quest Settings")
@export var quest_name: String
@export var quest_description: String
@export var reached_goal_text: String
@export var locked_quest: String


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

var jewels_collected_text: String
