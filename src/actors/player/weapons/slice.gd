extends Area2D

var damage = 20
var curd = Vector2.ZERO
onready var kill_timer = $KillTimer
var ppos = Vector2.ZERO
#var parent = get_parent()
var is_crit = false
var speed = 10

func _ready():
	$sound.play()
	kill_timer.start()

func set_direction(direction: Vector2):
	curd = direction
	set_rotation(direction.angle())

func _on_Slice_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(damage)
		queue_free()

func get_damage():
	return damage
func set_damage(setdamage: float):
	damage = setdamage

func _on_KillTimer_timeout() -> void:
	queue_free()

func set_cpos(cpos: Vector2):
	self.position = cpos
	

func gettime() -> float:
	return kill_timer.timeleft()
	
#have it following a quarter circle shape. 
func _process(delta: float) -> void:
	#self.position = parent.position
	if $KillTimer.get_time_left() > 0:
		var parent = get_parent()
	#self.position = parent.get_cpos()
		var swing = curd.angle() + (PI/6)*delta*10*PI
	#print(swing)
	#print(delta)
		set_rotation(swing)
	var parent = get_parent()
	#var curpos = parent.global_position
	#self.position = curpos
	
	if curd != Vector2.ZERO:
		var velocity = curd * speed
		
		global_position += velocity
	
	#swing += Vector2(delta, delta)
	#swing += Vector2(30,30)
	
	
	#set_direction(swing)
	
