extends Area2D
class_name Bullet
export (int) var speed = 20
var damage = 5

var direction := Vector2.ZERO
var spin = PI

onready var kill_timer = $KillTimer

func _ready():
	kill_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity
	spin+=1
	self.set_rotation(spin)

func set_direction(direction: Vector2):
	self.direction = direction
	

func _on_KillTimer_timeout():
	queue_free()

func gettime() -> float:
	return kill_timer.timeleft()
	
func _on_Bullet_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(damage)
		queue_free()

