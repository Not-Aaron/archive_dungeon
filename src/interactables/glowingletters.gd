extends Node2D
class_name GlowingLetters
export (float) var initial = 2
export (float) var intensity = 0.1
export (Texture) var texture
export (float) var maximum = 5
export (float) var minimum = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	$Sprite.set_texture(texture)
	$lights.set_texture(texture)
	initial+=intensity
	if ( initial >= maximum ) or ( initial <= minimum ):
		intensity = intensity * -1
	
	$lights.set_energy(initial)
