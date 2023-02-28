extends Control

var scene1 = [load("res://Cutscene/cutscene1.png"),2]
var sniper = [load("res://Textures/sniper.png"),1]
var l_snipe = [load("res://Textures/laser_sniper.png"),0.5]
var machine = [load("res://cat.jpg"),0.5]

#progression for (var : image) |-|-|->
onready var image := [scene1,sniper,l_snipe,machine]
var current_image = -1
var near_switch = -1

func _process(delta):
	if $Timer.is_stopped():
		if current_image < (image.size() -1):
			current_image += 1
		near_switch += 1
		var cur_img = image[current_image]
		$TextureRect.texture = cur_img[0]

		var image_time = cur_img[1]
		$Timer.wait_time = image_time

		$Timer.start()

	if near_switch >= image.size():
		$AnimationPlayer.play("fade")
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Game/Node2D.tscn")
