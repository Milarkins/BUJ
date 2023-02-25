extends Node2D

onready var enemy_path = load("res://Enemies/Enemy.tscn")
export(Array) var pickup_path
onready var this_pickup = pickup_path[rand_range(0,pickup_path.size())]
onready var view = get_viewport_rect().size

var time = 5
var multiple = 1.5

func _ready():
	randomize()

func _process(delta):
	$Delay.wait_time = time

	if $Delay.is_stopped():
		var baddie = enemy_path.instance()

		baddie.global_position = Vector2(
			rand_range(0, view.x*multiple),
			rand_range(0, view.y*multiple))

		get_tree().current_scene.add_child(baddie)
		$Delay.start()

	if $PickupDelay.is_stopped():
		var picky = this_pickup.instance()

		picky.global_position = Vector2(
			rand_range(0, view.x*multiple),
			rand_range(0, view.y*multiple))

		get_tree().current_scene.add_child(picky)
		$PickupDelay.start()
