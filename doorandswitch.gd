extends Node2D
#make a manipulatable transform for switch and door positions
#either vectors ro floats
#get rotation to
onready var switch = $switch
onready var door = $switchdoor
export (float) var switch_x =0
export (float) var switch_y=0
export (float) var door_x=0
export (float) var door_y=0

export (bool) var rotated=false



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	door.position = Vector2(door_x,door_y)
	switch.position = Vector2(switch_x,switch_y)
	if rotated == true:
		door.rotation = PI/2
	if switch.get_on() == true:
		door.take_on()
	
