extends Node2D
onready var player = get_parent()
var health = 0
var max_health = 0
var clearance = 0
var clearance_requirement = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	 health = player.health
	 max_health = player.max_health
	 clearance = player.clearance
	 clearance_requirement = player.clearance_requirement
