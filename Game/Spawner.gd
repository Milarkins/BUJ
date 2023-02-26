extends Node2D

onready var enemy_path = load("res://Enemies/Enemy.tscn")
export(Array) var pickup_path
onready var this_pickup
onready var view = get_viewport_rect().size

var time = 5

func _ready():
	randomize()

func _process(delta):
	$Delay.wait_time = time

	if $Delay.is_stopped():
		var baddie = enemy_path.instance()

		baddie.global_position = Vector2(
			rand_range(0, view.x),
			rand_range(0, view.y))

		get_tree().current_scene.add_child(baddie)
		$Delay.start()

	if $PickupDelay.is_stopped():
		this_pickup = pickup_path[rand_range(0,pickup_path.size())]
		var picky = this_pickup.instance()

		picky.global_position = Vector2(
			rand_range(0, view.x),
			rand_range(0, view.y))

		get_tree().current_scene.add_child(picky)
		$PickupDelay.start()
