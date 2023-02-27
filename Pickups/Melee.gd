extends Area2D

func _ready():
	$FX.play()
	yield(get_tree().create_timer(0.1), "timeout")
	queue_free()

func entered(body):
	if body is enemy:
		body.health -= 20
		body.knockback(global_position)
