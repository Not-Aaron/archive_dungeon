extends Area2D
class_name Eye
export (int) var speed = 20
var damage = 20

var direction := Vector2.ZERO
var spin = PI
onready var kill_timer = $KillTimer

func _ready():
	kill_timer.start()
	$AnimatedSprite.animation = "shot"
	$AnimatedSprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		var velocity = position.direction_to(direction) * speed
		
		global_position += velocity
	#spin+=1
	#self.set_rotation(spin)
	
	
func set_direction(direction: Vector2):
	self.direction = direction
	

func _on_KillTimer_timeout():
	queue_free()


func _on_Bullet_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		if body.has_method("take_blind"):
			body.take_blind()
		queue_free()
	
		



