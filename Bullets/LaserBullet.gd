extends KinematicBody2D
var speed
var damage_range = Vector2(0,0)

func _ready():
	yield(get_tree().create_timer(30), "timeout")
	queue_free()

func _process(delta):
	var direction = global_transform.basis_xform(Vector2.RIGHT)
	move_and_slide(direction * speed)

func _on_Area2D_body_entered(body):
	if body is enemy:
		body.health -= round(rand_range(damage_range.x,damage_range.y))
		body.knockback(global_position)
 
