extends Node2D

func _ready():
	get_tree().current_scene.get_node("Player").health += 50
	yield(get_tree().create_timer(0.1), "timeout")
	queue_free()
