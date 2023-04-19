extends Node2D
var switched=false
export (PackedScene) var winscreen
export (float) var part
onready var player = $Player
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if part==1:
		player.global_position = Vector2(1550,971)
	if part==2:
		player.global_position = Vector2(-279,1037)
	$music1.play()
	#$music1.play() # Replace with function body.

func phase_switch():
	$music1.stop()
	$music2.play()
	#var pres = $mrpresident
#pres.$left.activate(pres.global_position)
	#pres.$right.activate(pres.global_position)
	
	switched==true
	

func _process(delta:float):
	if $mrpresident.phase==1 and switched==false:
		phase_switch()

func endtime_start():
	$endtime.start()


func _on_endtime_timeout():
	get_tree().change_scene_to(winscreen) # Replace with function body.
