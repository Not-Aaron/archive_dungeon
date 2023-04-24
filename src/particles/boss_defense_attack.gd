extends Area2D
class_name zap
export (int) var speed = 2

var direction := Vector2.ZERO
var velocity = Vector2.ZERO
var spin = PI
var damage = 2
onready var kill_timer = $KillTimer
onready var light =$light
var i = 1
var j = .1

#var rng = RandomNumberGenerator.new()

func _ready():
	kill_timer.start()
	$AnimatedSprite.animation = "shot"


func _physics_process(_delta: float):
	i+=j
	if ( i >=5 ) or ( i <= 1 ):
		j = j * -1
	light.set_energy(i)
	if direction != Vector2.ZERO:
		
		#var velocity = position.direction_to(direction) * speed 
		var velocity = direction*speed
		global_position += velocity
	#if position.direction_to(direction)==Vector2(0,0):
	#	queue_free()

	
	
func set_direction(direction: Vector2):
	self.direction = direction 
	set_rotation(direction.angle())
	#set_rotation(direction.angle()+PI/4)
	

func _on_KillTimer_timeout():
	queue_free()

func _on_bossdefenseattack_body_entered(body):
	
	if body.has_method("take_damage"):
		body.take_damage(damage)
		if body.has_method("take_slow"):
			body.take_slow()
		queue_free() 