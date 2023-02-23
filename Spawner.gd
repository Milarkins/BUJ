extends Node2D

onready var enemy_path = load("res://Enemies/Enemy.tscn")
onready var view = get_viewport_rect().size

func _ready():
	set_spawn_delay(5)
	randomize()

func _process(delta):
	if $Delay.is_stopped():
		var baddie = enemy_path.instance()

		baddie.global_position = Vector2(
			rand_range(0, view.x),
			rand_range(0, view.y)
		)

		get_tree().current_scene.add_child(baddie)
		$Delay.start()

func set_spawn_delay(time):
	$Delay.wait_time = time
