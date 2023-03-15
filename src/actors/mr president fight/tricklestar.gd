extends Area2D
class_name tricklestar
export (int) var speed = .5
#onready var player = $"../Player"
export (PackedScene) var Burst
var direction := Vector2.ZERO
var spin = PI
var damage = 1
onready var kill_timer = $KillTimer
var rng = RandomNumberGenerator.new()
#var rng = RandomNumberGenerator.new()
var i = 1
var j = .1

func _ready():
	kill_timer.set_wait_time(rng.randf_range(.1,5))
	kill_timer.start()
	speed = rng.randf_range(.33,.66)
	$AnimatedSprite.animation = "shot"
	$AnimatedSprite.play()
	#var my_random_number = rng.randf_range(.5, 1.5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	
	i+=j
	if ( i >=5 ) or ( i <= 1 ):
		j = j * -1
	
	$lights.set_energy(i)
	if direction != Vector2.ZERO:
		
		var velocity = position.direction_to(direction) * speed 
		
		global_position += velocity
	spin+=1
	#self.set_rotation(spin)
	$particles.set_rotation(spin)
	
	
func set_direction(direction: Vector2):
	self.direction = direction 
	

func _on_KillTimer_timeout():
	for i in range(2):
		#$weapon.burst(player.position)
		var x = rng.randf_range(-1000,1000)
		var y = rng.randf_range(-1000, 1000)
	
		var randomtarg = Vector2(x,y) * Vector2(x,y)
		
		$weapon.burst(randomtarg)
	
	queue_free()






func _on_Tar_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		if body.has_method("take_slow"):
			body.take_slow()
		queue_free()
	 # Replace with function body.


func _on_cooldown_timeout():
	pass # Replace with function body.
