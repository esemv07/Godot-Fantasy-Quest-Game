extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null

var health = 100
var player_in_attack_zone = false
var can_take_damage = true
var dying = false
var hit = false

var quest: EnemyQuest

func _physics_process(delta: float) -> void:
	deal_with_damage()
	update_health()
	
	if player_chase:
		if dying == false && hit == false:
			position += (player.position - position)/speed
			$AnimatedSprite2D.play("walk")
			
			if (player.position.x - position.x) < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
	
	else:
		if dying == false && hit == false:
			$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false


func enemy():
	pass


func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_attack_zone = true


func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_attack_zone = false


func deal_with_damage():
	if player_in_attack_zone and GameManager.player_attacking == true:
		if can_take_damage == true:
			health -= 20
			$DamageCooldown.start()
			can_take_damage = false
			if health > 0:
				hit = true
			print("slime health = ", health)
			if health <= 0:
				health = 0
				hit = false
				dying = true
				$AnimatedSprite2D.play("death")
				$DeathTimer.start()
			if hit == true:
				$AnimatedSprite2D.play("hit")
				$HitTimer.start()

func _on_hit_timer_timeout() -> void:
	hit = false


func _on_death_timer_timeout() -> void:
	quest.reached_goal()
	self.queue_free()


func _on_damage_cooldown_timeout() -> void:
	can_take_damage = true


func update_health():
	var health_bar = $HealthBar
	health_bar.value = health


func _on_health_regen_timeout() -> void:
	if health < 100 and health > 0:
		health += 5
		if health > 100:
			health = 100
	if health <= 0:
		health = 0
