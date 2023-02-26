extends Area2D

func _ready():
	yield(get_tree().create_timer(0.1), "timeout")
	queue_free()

func entered(body):
	if body is enemy:
		body.health -= 5
		body.knockback(global_position)
