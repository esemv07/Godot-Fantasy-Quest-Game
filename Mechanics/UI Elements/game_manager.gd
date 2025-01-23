extends Node

var gems = 0
var xp = 0
var player_attacking = false
var player_health = 100
var quest_active = false

func _process(delta: float) -> void:
	update_health()
	$"CanvasLayer/XP Count".text = str(xp)
	$"CanvasLayer/Gem Count".text = str(gems)


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
