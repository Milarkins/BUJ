extends KinematicBody2D
var speed

var explosion = load("res://Bullets/Explosion.tscn")
func _process(delta):
	var direction = global_transform.basis_xform(Vector2.RIGHT)
	move_and_slide(direction * speed)
	_begin()
	speed -= (speed*2) * delta

func _begin():
	yield(get_tree().create_timer(speed/100), "timeout")
	var expl = explosion.instance()
	expl.global_position = global_position
	get_tree().current_scene.add_child(expl)
	queue_free()
