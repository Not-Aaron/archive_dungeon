extends Area2D
class_name tricklestarb
export (int) var speed = 1
onready var player = $"../Player"
export (PackedScene) var Burst
var direction := Vector2.ZERO
var spin = PI
var damage = 12
onready var kill_timer = $KillTimer
#var rng = RandomNumberGenerator.new()
var rng = RandomNumberGenerator.new()
#var target = Vector2.ZERO
func _ready():
	kill_timer.set_wait_time(rng.randf_range(.1,5))
	kill_timer.start()
	speed = rng.randf_range(.75,1.25)
	$AnimatedSprite.animation = "shot"
	$AnimatedSprite.play()
	#var my_random_number = rng.randf_range(.5, 1.5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	
	if direction != Vector2.ZERO:
		
		var velocity = position.direction_to(direction) * speed 
		
		global_position += velocity
	spin+=1
	#self.set_rotation(spin)
	
	
func set_direction(direction: Vector2):
	self.direction = direction 
	

func _on_KillTimer_timeout():
	for i in range(2):
		var x = rng.randf_range(-9999,9999)
		var y = rng.randf_range(-9999,9999)
	
		#var randomtarg = self.direction * Vector2(x,y) 
		
		#$weapon.burst(randomtarg)
		
		
		$weapon.burst(self.direction)
	
	queue_free()






func _on_tricklestarbursts_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		if body.has_method("take_slow"):
			body.take_slow()
		queue_free()
	 # Replace with function body.


func _on_cooldown_timeout():
	pass # Replace with function body.
