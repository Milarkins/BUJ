extends KinematicBody2D

func _ready():
	yield(get_tree().create_timer(30), "timeout")
	queue_free()

func _process(delta):
	var direction = global_transform.basis_xform(Vector2.RIGHT)
	move_and_slide(direction * 500)


func _on_Area2D_body_entered(body):
	if body is player:
		body.health -= round(rand_range(7,10))
		body.knockback(global_position)
		queue_free()
