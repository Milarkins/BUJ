extends Button

func _ready():
	visible = false

func pressed():
	play_sound(load("res://SFX/Button2.mp3"))
	get_tree().paused = false
	get_tree().current_scene.start_attack()
	get_tree().current_scene.decrease()

func _on_Button4_mouse_entered():
	play_sound(load("res://SFX/Button.mp3"))

func play_sound(sound):
	$FX.stream = sound
	$FX.play()
