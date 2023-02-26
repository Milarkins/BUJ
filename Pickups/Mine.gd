extends KinematicBody2D

var explosion = load("res://Bullets/Explosion.tscn")

func entered(body):
	if body is enemy:
		var expl = explosion.instance()
		expl.global_position = global_position
		get_tree().current_scene.add_child(expl)
		queue_free()
