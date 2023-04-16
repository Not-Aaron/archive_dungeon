extends Area2D
var direction
var speed = 5
var dirpos

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		#var velocity = position.direction_to(direction) * speed 
		dirpos =position.direction_to(direction)
		var velocity = dirpos*speed
		#var velocity = direction * speed
		global_position += velocity
	if global_position>=direction:
		for i in range(0,4):
			#PI/2 *+PI/2*I
			var angl = PI/4 + (i * PI/2)
			
			$burst.shoot(Vector2(cos(angl),sin(angl)))
			
			
func set_direction(direction: Vector2):
	self.direction = direction 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
