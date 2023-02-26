extends Area2D
class_name pickup

export(Texture) var item_visual
export(Resource) var item
export(float) var cooldown_time

func _ready():
	$Sprite.texture = item_visual

func entered(body):
	if body is player:
		body.current_pickup = item
		body.cooldown.stop()
		body.cooldown.wait_time = cooldown_time
		queue_free()
