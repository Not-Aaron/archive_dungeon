extends Area2D
class_name Bullet
export (int) var speed = 20
export (int) var damage = 15
var pierce = 0
var direction := Vector2.ZERO
var spin = PI
# crit system, does 2 time damage
#pierces twice
export (PackedScene) var critpar
var is_crit = false


onready var kill_timer = $KillTimer
var rng = RandomNumberGenerator.new()

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
	return kill_timer.get_time_left()
func get_damage():
	return damage
func set_damage(setdamage: float):
	damage = setdamage
func _on_Bullet_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
	#	var crit = rand_range(0,4)
	#	var totdamage = damage
	#	if crit >= 3:
	#		totdamage = damage * 2
			#$crit.visible = true
			#var critical = critpar.instance()
			#critical.global_position = global_position
			#critical.position = self.position
	#		var parent = get_parent()
			
			#have crit as its own scene and instance it at that position
	#	else:
	#		totdamage=damage
		if is_crit == true:
			
		#	var parent = get_parent()
			var player = $"../Player"
			player.critical_land(self.position)
		#	parent.critical_land(self.position)
			
		if pierce >= 1:
			
			area.take_damage(damage)
			queue_free()
		else:
			area.take_damage(damage)
			pierce+=1
