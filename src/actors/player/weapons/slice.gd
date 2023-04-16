extends Area2D

var damage = 20
var curd = Vector2.ZERO
onready var kill_timer = $KillTimer
var ppos = Vector2.ZERO
#var parent = get_parent()
var is_crit = false
var speed = 10
var swing = 0
#export (Vector2) var direction




func _ready():
	$sound.play()
	kill_timer.start()

func set_direction(direction: Vector2):
	curd = direction
#	swing = curd.angle()
	swing = curd.angle()+PI/4

	set_rotation(swing)
#	set_rotation(direction.angle()+(PI/4))

func _on_Slice_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(damage)
		#queue_free()

func get_damage():
	return damage
func set_damage(setdamage: float):
	damage = setdamage

func _on_KillTimer_timeout() -> void:
	#queue_free()
	$CollisionShape2D.set_disabled(true)
	$PlaceholderSprite.set_visible(false)
	#pass

func set_cpos(cpos: Vector2):
	self.position = cpos
	

func gettime() -> float:
	return kill_timer.timeleft()
	
#have it following a quarter circle shape. 
func _process(delta: float) -> void:
	#self.position = parent.position
	if $KillTimer.get_time_left() > 0:

	#	var swing = curd.angle()+(PI/8) - (PI/8)*delta*6
	#starts pi/8 away from target, and in .1 seconds will rotate Pi/4 degrees total. .1 seconds is roguhly 6 frames. 
	#delta is seconds per frame, which is roughly 1/60, so we multiple by 6

		swing = swing - (PI/12)
		set_rotation(swing)

	var player = $"../Player"

	self.global_position=player.global_position
