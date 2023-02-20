extends Area2D
class_name pickup

export(Texture) var item_visual
export(Resource) var item

func _ready():
	$Sprite.texture = item_visual

func entered(body):
	if body is player:
		body.current_pickup = item
		queue_free()
