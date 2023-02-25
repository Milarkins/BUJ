extends KinematicBody2D
class_name enemy

export(int, "Hunter", "Dog") var type
onready var type_num : int = rand_range(0,2)
onready var player = get_tree().get_nodes_in_group("Player")
var health = 100

var inRange := []

onready var hunter_bullet = load("res://Bullets/EnemyBullet.tscn")

enum hunter {
	Move,
	Shoot,
	Flee
}

enum dog {
	Move,
	Bite
}

var current_state = hunter.Move
export(float) var speed = 100

onready var view = get_viewport_rect().size
var was_knockbacked = false

func _ready():
	type = type_num

func _process(delta):
	health = clamp(health, 0, 100)
	if health == 0:
		queue_free()

	#movement
	var multiple = 1.5
	global_position.x = clamp(global_position.x, 0, view.x*multiple)
	global_position.y = clamp(global_position.y, 0, view.y*multiple)
	
	var playerPos = player[0].global_position
	var dir = global_position.direction_to(playerPos)
	var dist = global_position.distance_to(playerPos)

	$ShotDir.look_at(playerPos)

	#keep way
	for i in inRange:
		var range_dir = global_position.direction_to(i.global_position)
		move_and_slide(-range_dir * (speed/3.5))

	if type == 0: #hunter
		if dist > 510:
			set_state(hunter.Move)
		elif dist < 490:
			set_state(hunter.Flee)
		elif dist >= 490 and dist <= 510:
			set_state(hunter.Shoot)

		match current_state:
			hunter.Move:
				move_and_slide(dir * speed)
			hunter.Shoot:
				if $Cooldown.is_stopped():
						var bullet = hunter_bullet.instance()

						bullet.global_position = global_position
						bullet.rotation = $ShotDir.rotation

						get_tree().current_scene.add_child(bullet)
						$Cooldown.start()
			hunter.Flee:
				move_and_slide(-dir * speed)

	if type == 1: #dog
		if dist > 100:
			set_state(dog.Move)
		else:
			set_state(dog.Bite)

		match current_state:
			dog.Move:
				move_and_slide(dir * speed)
			dog.Bite:
				if $Cooldown.is_stopped():
					player[0].health -= round(rand_range(5,8))
					$Cooldown.start()

func set_state(state):
	current_state = state

func range_enter(body):
	if body != self and body.is_in_group("Enemies"):
		inRange.append(body)

func range_exit(body):
	if body:
		inRange.erase(body)
