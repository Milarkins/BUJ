extends Position2D

func _ready():
	yield(get_tree().create_timer(300), "timeout")
	queue_free()
