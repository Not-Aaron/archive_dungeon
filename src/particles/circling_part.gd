extends Node2D
export (ImageTexture) var text
export (AnimatedTexture) var atext
onready var part = $part
export (float) var opacity = 255
export (Vector2) var scae = (Vector2(1,1))

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#part.set_self_modulate(Color(255,255,255,opacity))
	#part.set_modulate(Color(255,255,255,opacity))
	part.set_modulate(Color(1,1,1,opacity))
	#var modu = part.get_modulate()
	
	part.set_scale(scae)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if text:
		part.texture = text
	if atext:
		part.texture = atext
		
