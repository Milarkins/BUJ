extends KinematicBody2D
var speed
var damage_range = Vector2(0,0) #so there's no errors

func _ready():
	yield(get_tree().create_timer(30), "timeout")
	queue_free()

var explosion = load("res://Bullets/Explosion.tscn")
func _process(delta):
	var direction = global_transform.basis_xform(Vector2.RIGHT)
	move_and_slide(direction * speed)

func entered(body):
	if body is enemy:
		var expl = explosion.instance()
		expl.global_position = global_position
		get_tree().current_scene.add_child(expl)
		queue_free()
