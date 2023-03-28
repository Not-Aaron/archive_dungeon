extends Node2D
class_name GlowingLetters
var i = 2
var j = 0.1
export (Texture) var texture

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
	i+=j
	if ( i >=5 ) or ( i <= 1 ):
		j = j * -1
	
	$lights.set_energy(i)
