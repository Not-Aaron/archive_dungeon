extends Area2D

var damage = 20
var curd = Vector2.ZERO
onready var kill_timer = $KillTimer
var ppos = Vector2.ZERO
#var parent = get_parent()
var is_crit = false

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
	var parent = get_parent()
	#self.position = parent.get_cpos()
	var swing = curd.angle() + (PI/3)*delta
	print(swing)
	set_rotation(swing)
	
	
	#swing += Vector2(delta, delta)
	#swing += Vector2(30,30)
	
	
	#set_direction(swing)
	
