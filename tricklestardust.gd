extends Area2D
class_name tricklestardust
export (int) var speed = 2
onready var player = $"../Player"
export (PackedScene) var Burst
var direction := Vector2.ZERO
var spin = PI
var damage = 4
onready var kill_timer = $KillTimer
var rng = RandomNumberGenerator.new()

func _ready():
	speed = rng.randf_range(1.5,2.5)
	kill_timer.start()
	$AnimatedSprite.animation = "shot"
	$AnimatedSprite.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		
		var velocity = position.direction_to(direction) * speed 
		
		global_position += velocity
	spin+=1
	
	
	
func set_direction(direction: Vector2):
	self.direction = direction 


func _on_KillTimer_timeout():
	queue_free()

func _on_tricklestardust_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		if body.has_method("take_slow"):
			body.take_slow()
		queue_free()
	 # Replace with function body.


func _on_cooldown_timeout():
	pass # Replace with function body.