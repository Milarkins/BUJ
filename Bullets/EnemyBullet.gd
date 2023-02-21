extends KinematicBody2D

func _process(delta):
	var direction = global_transform.basis_xform(Vector2.RIGHT)
	move_and_slide(direction * 500)


func _on_Area2D_body_entered(body):
	if body is player:
		body.health -= 10
		queue_free()
