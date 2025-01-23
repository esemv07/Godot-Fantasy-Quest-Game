extends CharacterBody2D

class_name PlayerController

@onready var all_interactions = []
@onready var interactLabel = $InteractLabel

@export var speed = 200
var direction = "down"

var enemy_in_attack_range = false
var enemy_attack_cooldown = true
var player_alive = true
var attacking = false


func _ready():
	update_interactions()
	
func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed


func _physics_process(delta: float) -> void:
	get_input()
	enemy_attack()
	attack()
	
	if GameManager.player_health <= 0:
		player_alive = false #game over
		GameManager.player_health = 0
		print("dead")
	
	if Input.is_action_just_pressed("interact"):
		execute_interaction()
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	
	if velocity.x != 0 && attacking == false:
		$AnimatedSprite2D.animation = "walk_right"
		direction = "right"
		$AnimatedSprite2D.flip_h = velocity.x < 0
		#direction = "left"
	elif velocity.y < 0 && attacking == false:
		$AnimatedSprite2D.animation = "walk_back"
		direction = "up"
	elif velocity.y > 0 && attacking == false:
		$AnimatedSprite2D.animation = "walk_forward"
		direction = "down"
	else:
		if attacking == false:
			$AnimatedSprite2D.play("idle_" + direction)
			
	move_and_slide()



#INTERACTIONS
##############################################


func _on_interaction_area_area_entered(area: InteractionArea) -> void:
	all_interactions.insert(0, area)
	update_interactions()


func _on_interaction_area_area_exited(area: InteractionArea) -> void:
	all_interactions.erase(area)
	update_interactions()


func update_interactions():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""
		
func execute_interaction():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		match cur_interaction.interact_type:
			"print_text" : print(cur_interaction.interact_value)



func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Enemy":
		enemy_in_attack_range = true


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.name == "Enemy":
		enemy_in_attack_range = false


func player():
	pass


func enemy_attack():
	if enemy_in_attack_range and enemy_attack_cooldown == true:
		GameManager.player_health -= 10
		enemy_attack_cooldown = false
		$AttackCooldown.start()
		print(GameManager.player_health)


func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true


func attack():
	if Input.is_action_just_pressed("interact"):
		GameManager.player_attacking = true
		attacking = true
		if direction == "right":
			$AnimatedSprite2D.play("attack_right")
			$DealAttack.start()
		if direction == "down":
			$AnimatedSprite2D.play("attack_forward")
			$DealAttack.start()
		if direction == "up":
			$AnimatedSprite2D.play("attack_back")
			$DealAttack.start()


func _on_deal_attack_timeout() -> void:
	$DealAttack.stop()
	GameManager.player_attacking = false
	attacking = false
