extends Position2D
export (PackedScene) var TarEnemy
export (PackedScene) var presidentattack
onready var player = $"../Player"
onready var attack = presidentattack

# Called when the node enters the scene tree for the first time.
func attack2():
	attack=TarEnemy
	var bullet_instance = attack.instance()
	var target = get_global_mouse_position()
	#var direction_to_mouse = global_position.direction_to(target).normalized()
	#bullet_instance.set_direction(direction_to_mouse)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
func attack1(target:Vector2):
	attack=presidentattack
	var bullet_instance = attack.instance()
	#target player!
	#var target = player.position
	#var direction_to_mouse = global_position.direction_to(target).normalized()
	#bullet_instance.set_direction(direction_to_mouse)
	bullet_instance.set_direction(target)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
#func switch():
	#match(attack):
		#Bullet:
		#	attack = Slice
		#Slice:
		#	attack = Bullet
