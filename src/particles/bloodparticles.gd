extends Node2D
onready var blood = $Particles2D
onready var parent = get_parent()
var rng = RandomNumberGenerator.new()
var i = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func parent_hit():
	blood.set_emitting(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	i = rng.randf_range(-100,100)
	#blood.process_material.set_param_max("initial_velocity",i)
	#blood.process_material.set_param_min("initial_velocity", i)
