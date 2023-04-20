extends AnimationPlayer
var rng = RandomNumberGenerator.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#delta for 60 fps, 60 * 4 seconds
	self.play() 
	self.advance(rng.randf_range(0,240)) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
