extends CharacterBody2D

class_name PlayerController

@onready var all_interactions = []
@onready var interactLabel = $"Interaction Components/InteractLabel"

@export var speed = 200
var direction = "down"

func _ready():
	update_interactions()

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed


func _physics_process(delta: float) -> void:
	get_input()
	
	if Input.is_action_just_pressed("interact"):
		execute_interaction()
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk_right"
		direction = "right"
		$AnimatedSprite2D.flip_h = velocity.x < 0
		#direction = "left"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "walk_back"
		direction = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "walk_forward"
		direction = "down"
	else:
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
