extends Control

func _ready():
	visible = false

func _process(delta):
	$Label.text = var2str(get_tree().current_scene.time_text)

func quit_pressed():
	get_tree().quit()

func replay_pressed():
	get_tree().reload_current_scene()

func set_text():
	var promts = [
		"Owwie",
		"Bruh",
		"Uh-Oh",
		"Ouch",
		"Loser",
		"You Died",
		"Lol",
		"Hehe",
		"Lmao",
		"Haha",
		"Ha",
		"Dweeb",
		"You Suck",
		"Extinct",
		"Dutch Win",
		"Dutch:1, Dodo:0"
		]
	$Label2.text = promts[rand_range(0,promts.size())]
