extends Area2D
class_name Eye
export (int) var speed = .4
var damage = 5

var direction := Vector2.ZERO
var spin = PI
onready var kill_timer = $KillTimer
var velocity

func _ready():
	kill_timer.start()
	$AnimatedSprite.animation = "shot"
	#$AnimatedSprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		velocity = position.direction_to(direction) * speed
		
		#var velocity = direction*speed
		global_position += velocity
	#spin+=1
	#self.set_rotation(spin)
	
#	var dirang = rad2deg(global_position.angle_to(direction))
	#var dirang = rad2deg(position.angle_to(direction))
	var dirang = rad2deg(position.angle_to(velocity))
	if dirang < 0:
		dirang = 360+dirang
	
	for s in range (0,32):
		var a = s*11.25
		if a > dirang:
			var f = s+4
			$AnimatedSprite.set_frame((f))
			break
	
	
func set_direction(direction: Vector2):
	self.direction = direction
	

func _on_KillTimer_timeout():
	#var dirang = global_position.angle_to(direction)
	
#	print(dirang)	
	#print(rad2deg(dirang))
	queue_free()
	
		





func _on_Eye_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		if body.has_method("take_blind"):
			body.take_blind()
		queue_free()
	 # Replace with function body.
