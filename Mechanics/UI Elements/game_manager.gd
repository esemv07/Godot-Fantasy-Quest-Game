extends Node

var gems = 0
var xp = 0
var player_attacking = false
var player_health = 100
var quest_active = false
var quest_lock_show = false
var jewel_collected = 0

func _process(delta: float) -> void:
	update_health()
	$"CanvasLayer/XP Count".text = str(xp)
	$"CanvasLayer/Gem Count".text = str(gems)
	$"Quest Box/Jewels Collected".text = str(jewel_collected)


func update_health():
	var health_bar = $CanvasLayer/HealthBar
	health_bar.value = player_health


func _on_health_regen_timeout() -> void:
	if player_health < 100:
		player_health += 5
		if player_health > 100:
			player_health = 100
	if player_health <= 0:
		player_health = 0

func quest_lock():
	$"Quest Box/QuestBoxDisappear".start()

func _on_quest_box_disappear_timeout() -> void:
	quest_lock_show = false
	print(quest_lock_show)
