extends Control

onready var player = get_tree().current_scene.get_node("Player")

func _process(delta):
	$Bar.value = player.health
	$Label.text = var2str(get_tree().current_scene.time_text)
