extends Node2D

var particles = load("res://Player/HealParticles.tscn")
func _ready():
	var player = get_tree().current_scene.get_node("Player")
	player.health += 50
	player.modulate = Color.green
	$FX.play()
	var part = particles.instance()
	part.global_position = global_position
	get_tree().current_scene.add_child(part)
	yield(get_tree().create_timer(0.5), "timeout")
	player.modulate = Color.white
	queue_free()
