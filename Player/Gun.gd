extends Position2D

var n_bullet = preload("res://Bullets/NormalBullet.tscn")
var e_bullet = preload("res://Bullets/ExplosiveBullet.tscn")
var l_bullet = preload("res://Bullets/LaserBullet.tscn")
export(int, "Normal", "Explosive", "Laser") var bullet_type
var current_bullet

export(float) var bullet_speed
export(float) var bullet_spread
export(int) var bullet_amount

export(float) var shot_delay

func _ready():
	$Cooldown.wait_time = shot_delay

func _process(delta):
	look_at(get_global_mouse_position())
	if bullet_type == 0:
		current_bullet = n_bullet
	if bullet_type == 1:
		current_bullet = e_bullet
	if bullet_type == 2:
		current_bullet = l_bullet

	if Input.is_action_pressed("Click") and $Cooldown.is_stopped():
			shoot()

func shoot():
	var bullets = []
	
	for i in bullet_amount:
		bullets.resize(bullet_amount)
		bullets[i] = current_bullet.instance()
		bullets[i].global_position = $ShootPoint.global_position
		bullets[i].speed = bullet_speed

		bullets[i].rotation = (rotation - (bullet_spread * (bullet_amount/2))) + bullet_spread * i
		
		get_tree().current_scene.add_child(bullets[i])
	$Cooldown.start()
