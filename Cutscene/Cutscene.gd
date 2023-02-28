extends Control

var scene1 = [load("res://Cutscene/cutscene1.png"),10,load("res://Cutscene/welcome_to_dodo_island.mp3")]
var scene2 = [load("res://Cutscene/cutscene3.png"),3,load("res://Cutscene/WHERES_MY_KIDS.mp3")]
var scene3 = [load("res://Cutscene/cutscene4.png"),5,load("res://Cutscene/DogGrowl.mp3")]
var scene4 = [load("res://Cutscene/cutscene5.png"),4,load("res://Cutscene/Shine.mp3")]
var scene5 = [load("res://Cutscene/cutscene6.png"),5,load("res://Cutscene/AngryCaw.mp3")]

#progression for (var : image) |-|-|->
onready var image := [scene1,scene2,scene3,scene4,scene5]
var current_image = -1
var near_switch = -1

var started_music = false

func _process(delta):
	if $Timer.is_stopped():
		if current_image < (image.size() -1):
			current_image += 1
		near_switch += 1
		var cur_img = image[current_image]
		$TextureRect.texture = cur_img[0]

		$FX.stop()
		$FX.stream = image[current_image][2]
		$FX.play()

		var image_time = cur_img[1]
		$Timer.wait_time = image_time

		$Timer.start()
	if current_image == 0:
		$AnimationPlayer.play("fade2")
	if current_image == 2 and started_music == false:
		$Music.play()
		started_music = true

	if near_switch >= image.size():
		$AnimationPlayer.play("fade")
		yield(get_tree().create_timer(1), "timeout")
		get_tree().change_scene("res://Game/Node2D.tscn")
