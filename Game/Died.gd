extends Control

func _ready():
	visible = false

func _process(delta):
	$Label.text = var2str(get_tree().current_scene.time_text)

func quit_pressed():
	get_tree().quit()

func replay_pressed():
	get_tree().reload_current_scene()
