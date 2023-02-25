extends Button

func _ready():
	visible = false

func pressed():
	get_tree().paused = false
	get_tree().current_scene.start_attack()
	get_tree().current_scene.decrease()
