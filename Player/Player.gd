extends KinematicBody2D
class_name player

var input_vector = Vector2.ZERO
var current_pickup

func _process(delta):
	input_vector = Vector2(
		Input.get_action_raw_strength("D") - Input.get_action_raw_strength("A"),
		Input.get_action_raw_strength("S") - Input.get_action_raw_strength("W")
	).normalized()

func _physics_process(delta):
	move_and_slide(input_vector * 300)
