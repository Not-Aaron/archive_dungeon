extends Area2D
class_name laser
#export (int) var speed = 900
var speed = 3
#onready var player = $"../Player"
export (PackedScene) var Burst
var direction := Vector2.ZERO
var spin = PI
var damage = 20
onready var kill_timer = $KillTimer
#onready var directiona
var rng = RandomNumberGenerator.new()
#var rng = RandomNumberGenerator.new()
var i = 1
var j = .1
var dirpos
onready var burst = $burst
var angl
##var parent = get_parent()
#var target = Vector2.ZERO

func _ready():
	#kill_timer.set_wait_time(rng.randf_range(.1,5))
	#kill_timer.start()
	#vv this is why it was moving so slow
	#speed = rng.randf_range(.33,.66)
	$AnimatedSprite.animation = "shot"
	$AnimatedSprite.play()
	#var my_random_number = rng.randf_range(.5, 1.5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	##target = parent.get_target()
	i+=j
	if ( i >=5 ) or ( i <= 1 ):
		j = j * -1
	
#	$lights.set_energy(i)
	#if direction != Vector2.ZERO:
	#var velocity = global_position.direction_to(direction)*speed
	if direction != Vector2.ZERO:
		#var velocity = position.direction_to(direction) * speed 
		dirpos =position.direction_to(direction)
		var velocity = dirpos*speed
		#var velocity = direction * speed
		global_position += velocity
	#if global_position>=direction:
		if position.distance_to(direction) <=10:
			for b in range(0,6):
			#PI/2 *+PI/2*I
				angl = PI/6 + (b * PI/6)
			#	angl = b*PI/6
				#print(b)
				#var angl = i
				#angl = b*(PI/2)
				print(cos(angl), sin(angl))
				#burst.shoot(Vector2())
				burst.shoot(Vector2(cos(angl),sin(angl)))
				#burst.shoot(Vector2(cos(angl),sin(angl)))
				
			queue_free()
	#spin+=1
	#self.set_rotation(spin)
	#$particles.set_rotation(spin)
	
	
func set_direction(direction: Vector2):
	self.direction = direction 
	#dirpos =position.direction_to(direction)
	

func _on_KillTimer_timeout():
	queue_free()
	#for i in range(2):
		#$weapon.burst(player.position)
		#var x = rng.randf_range(-1000,1000)
		#var y = rng.randf_range(-1000, 1000)
	
		#var randomtarg = Vector2(x,y) * Vector2(x,y)
		#var randomtarg = self.direction + Vector2(rng.randf_range(-5,5), rng.randf_range(-5,5))
		##var randomtarg = target
		#var randomtarg = self.direction
		###$weapon.burst(randomtarg)
	#pass
	#queue_free()

func get_target():
	#return parent.get_target()
	pass

func _on_laser_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)# Replace with function body.
