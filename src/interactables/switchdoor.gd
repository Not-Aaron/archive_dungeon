extends Area2D
var is_on = false
onready var door_block = $StaticBody2D 
onready var collisionshape = door_block.get_child(0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_on():
	if is_on ==false:
		is_on = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_on == true:
		collisionshape.set_disabled(true)
		$AnimatedSprite.animation = "open"
	else:
		collisionshape.set_disabled(false)
		$AnimatedSprite.animation = "locked"
