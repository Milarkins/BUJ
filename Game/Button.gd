extends Button

onready var player = get_tree().current_scene.get_node("Player")

#guns
var shotgun = [200,0.5,3,1,0,load("res://Textures/shotgun.png"),Vector2(40,50)]
var sniper = [400,0,1,1,0,load("res://Textures/sniper.png"),Vector2(80,100)]
var l_snipe = [400,0,1,1,2,load("res://Textures/laser_sniper.png"),Vector2(70,100)]
var machine = [500,0,1,0.1,0,load("res://Textures/laser_sniper.png"),Vector2(20,40)]
var pistol = [300,0,1,0.5,0,load("res://Textures/shotgun.png"),Vector2(-20,20)]
var rocket = [300,0,1,2,1,load("res://Textures/shotgun.png"),Vector2(0,0)]
var l_shot = [200,0.5,3,1,2,load("res://Textures/shotgun.png"),Vector2(30,40)]

onready var gun_list := [shotgun,l_snipe,pistol,rocket,l_shot,machine,sniper]

onready var current_gun = gun_list[rand_range(0,gun_list.size())]

var set_speed
var set_spread 
var set_amount
var set_delay
var set_type
var set_texture
var set_damage_range

func _ready():
	randomize()
	set_all()

func reset():
	randomize()
	current_gun = gun_list[rand_range(0,gun_list.size())]

func set_all():
	set_speed = current_gun[0]
	set_spread = current_gun[1] 
	set_amount = current_gun[2]
	set_delay = current_gun[3]
	set_type = current_gun[4]
	set_texture = current_gun[5]
	set_damage_range = current_gun[6]
	$Sprite.texture = current_gun[5]

func pressed():
	player.get_node("Gun").bullet_speed = set_speed
	player.get_node("Gun").bullet_spread = set_spread
	player.get_node("Gun").bullet_amount = set_amount
	player.get_node("Gun").shot_delay = set_delay
	player.get_node("Gun").bullet_type = set_type
	player.get_node("Gun").get_node("GunSprite").texture = set_texture 
	player.get_node("Gun").bullet_damage_range = set_damage_range

	get_tree().paused = false
	get_tree().current_scene.start_attack()
	get_tree().current_scene.decrease()
	get_parent().get_node("Button4").visible = true
