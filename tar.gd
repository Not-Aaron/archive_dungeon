extends Area2D
class_name Tarshot
export (int) var speed = 20

var direction := Vector2.ZERO
var spin = PI
var damage = 1
onready var kill_timer = $KillTimer
#var rng = RandomNumberGenerator.new()

func _ready():
	kill_timer.start()
	$AnimatedSprite.animation = "shot"
	$AnimatedSprite.play()
	#var my_random_number = rng.randf_range(.5, 1.5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		
		var velocity = position.direction_to(direction) * speed 
		
		global_position += velocity
	spin+=1
	self.set_rotation(spin)
	
	
func set_direction(direction: Vector2):
	self.direction = direction 
	

func _on_KillTimer_timeout():
	queue_free()






func _on_Tar_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		if body.has_method("take_slow"):
			body.take_slow()
		queue_free()
	 # Replace with function body.
