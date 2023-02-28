extends TextureRect

func entered(body):
	if body is player:
		body.health -= 10
		visible = false
		$FX.play()
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()
