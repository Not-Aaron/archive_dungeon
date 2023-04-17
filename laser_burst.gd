extends Area2D
var direction
var speed = 1
var dirpos

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(_delta: float):
	
	if direction != Vector2.ZERO:
		#dirpos =position.direction_to(direction)
		var velocity = direction * speed
		#var velocity = dirpos*speed
		global_position += velocity

	#if position.direction_to(direction)<=Vector2.ZERO:
	#if position.direction_to(direction)==self.position:
	#	for i in range(0,4):
	#	var angl = PI/4 + (i * PI/2)
	#		$burst.shoot(Vector2(cos(angl),sin(angl)))
	#	queue_free()
func set_direction(direction: Vector2):
	self.direction = direction 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
