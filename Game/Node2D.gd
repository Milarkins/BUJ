extends Node2D

onready var spawner = $Spawner

enum {
	Choosing,
	Attacking
}

var current_phase

func _ready():
	phase(Choosing)
	current_song(load("res://Music/edge_is_everything.mp3"))
	time_text = "Choose Gun!"

var time = 0
var time_text : String
var timer_on = false
func _process(delta):
	timer(delta)

	var buttons = get_tree().get_nodes_in_group("button")
	var enemies = get_tree().get_nodes_in_group("Enemies")

	match current_phase:
		Choosing:
			get_tree().paused = true
			$CanvasLayer/GunOptions.visible = true
			for i in buttons:
				i.set_all()
				i.reset()
		Attacking:
			end_attack()

func decrease():
	$Spawner.time -= 0.5

func start_attack():
	phase(Attacking)
	$CanvasLayer/GunOptions.visible = false
	$Timer.start()

func end_attack():
	if $Timer.is_stopped():
		phase(Choosing)

func phase(p):
	current_phase = p

func timer(t):
	if timer_on:
		time += t

	var mils = fmod(time,1)*1000
	var secs = fmod(time,60)
	var mins = fmod(time,60*60) / 60

	var time_passed = "%02d : %02d : %03d" % [mins,secs,mils]
	if timer_on == false:
		time_text = "Choose Gun!"
	else:
		time_text = time_passed

func end_timer():
	timer_on = false

func current_song(song):
	$Music.stream = song
	$Music.play()
