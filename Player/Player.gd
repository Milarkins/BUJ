extends KinematicBody2D
class_name player

var input_vector = Vector2.ZERO
var current_pickup

onready var cooldown = $Cooldown
onready var view = get_viewport_rect().size

var health = 100

func _process(delta):
	health = clamp(health, 0, 100)
	if health == 0:
		get_tree().paused = true
		get_tree().current_scene.get_node("CanvasLayer/UI").visible = false
		get_tree().current_scene.get_node("CanvasLayer/Died").visible = true
		get_tree().current_scene.end_timer()

	input_vector = Vector2(
		Input.get_action_raw_strength("D") - Input.get_action_raw_strength("A"),
		Input.get_action_raw_strength("S") - Input.get_action_raw_strength("W")
	).normalized()
	
	var multiple = 1.5
	global_position.x = clamp(global_position.x, 0, view.x*multiple)
	global_position.y = clamp(global_position.y, 0, view.y*multiple)

	if current_pickup != null:
		if Input.is_action_just_pressed("Click2") and cooldown.is_stopped():
			var current = current_pickup.instance()
			current.global_position = global_position
			current.rotation = $Gun.rotation
			get_tree().current_scene.add_child(current)
			cooldown.start()

func _physics_process(delta):
	move_and_slide(input_vector * 300)
