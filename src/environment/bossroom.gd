extends Node2D
var switched=false
export (PackedScene) var winscreen

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$music1.play()
	#$music1.play() # Replace with function body.

func phase_switch():
	$music1.stop()
	$music2.play()
	switched==true
	

func _process(delta:float):
	if $mrpresident.phase==1 and switched==false:
		phase_switch()

func endtime_start():
	$endtime.start()


func _on_endtime_timeout():
	get_tree().change_scene_to(winscreen) # Replace with function body.
