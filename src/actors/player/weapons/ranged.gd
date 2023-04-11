extends Position2D
export (PackedScene) var Bullet	
export (PackedScene) var Slice
onready var attack = Slice
onready var cooldown = false
var cpos = Vector2.ZERO
var bullet_instance = null
# Called when the node enters the scene tree for the first time.



func _process(delta: float) -> void:
	#var parent = get_parent()
	#cpos = parent.position
	if bullet_instance:
		if bullet_instance.has_method("set_cpos"):
			bullet_instance.set_cpos(self.position)
#func get_cpos():
#	return cpos
func shoot():
	#if $atkcd.is_stopped() == false or $atkcd.get_time_left()!=0:
		#return
		#$atkcd.start
#	if $atkcd.get_time_left() !=0 and $atkcd.get_time_left()>=0:
	#	return
	#different weapons ahve different cooldowns
	#if $atkcd.get_time_left()>0:
		#return
	if cooldown == false:
		#return
		$atkcd.start()
		

		var bullet_instance = attack.instance()
		var target = get_global_mouse_position()
		var direction_to_mouse = global_position.direction_to(target).normalized()
		bullet_instance.set_direction(direction_to_mouse)
		get_parent().get_parent().add_child(bullet_instance)
		bullet_instance.global_position = global_position
		cooldown == true
func switch():
	match(attack):
		Bullet:
			attack = Slice
		Slice:
			attack = Bullet


func _on_atkcd_timeout():
	cooldown == false # Replace with function body.
