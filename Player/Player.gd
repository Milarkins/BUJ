extends KinematicBody2D
class_name player

var input_vector = Vector2.ZERO
var current_pickup

onready var cooldown = $Cooldown

var health = 100

func _process(delta):
	health = clamp(health, 0, 100)
	if health == 0:
		pass
	print(health)
	
	input_vector = Vector2(
		Input.get_action_raw_strength("D") - Input.get_action_raw_strength("A"),
		Input.get_action_raw_strength("S") - Input.get_action_raw_strength("W")
	).normalized()

	if current_pickup != null:
		if Input.is_action_just_pressed("Click2") and cooldown.is_stopped():
			var current = current_pickup.instance()
			current.global_position = global_position
			current.rotation = $Gun.rotation
			get_tree().current_scene.add_child(current)
			cooldown.start()

func _physics_process(delta):
	move_and_slide(input_vector * 300)
