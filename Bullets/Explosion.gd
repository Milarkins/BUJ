extends Area2D

func _ready():
	yield(get_tree().create_timer(2), "timeout")
	queue_free()


func _on_Explosion_body_entered(body):
	if body is enemy:
		body.health -= 10
