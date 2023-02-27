extends Area2D
class_name pickup

export(Texture) var item_visual
export(Resource) var item
export(float) var cooldown_time

func _ready():
	$Sprite.texture = item_visual

	yield(get_tree().create_timer(15), "timeout")
	queue_free()

func entered(body):
	if body is player:
		body.current_pickup = item
		body.cooldown.stop()
		body.cooldown.wait_time = cooldown_time
		get_tree().current_scene.get_node("CanvasLayer/UI/CurrentItem").texture = item_visual
		queue_free()
