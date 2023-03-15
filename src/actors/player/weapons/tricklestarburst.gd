extends Position2D
export (PackedScene) var TarEnemy
export (PackedScene) var presidentattack
onready var player = $"../Player"
onready var attack = presidentattack

func burst(target:Vector2):
	#attack=presidentattack
	var bullet_instance = attack.instance()
	#target player!
	#var target = position.distance_to(player.position).normalized
	#var direction_to_mouse = global_position.direction_to(target).normalized()
	#bullet_instance.set_direction(direction_to_mouse)
	bullet_instance.set_direction(target)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
func attack(target:Vector2):
	pass

func attack1(target:Vector2):
	#attack=presidentattack
	var bullet_instance = attack.instance()
	#target player!
	#var target = position.distance_to(player.position).normalized
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


func switch():
	match(attack):
		TarEnemy:
			attack = presidentattack
		presidentattack:
			attack = TarEnemy # Replace with function body.
			
func getphase():
	return attack
