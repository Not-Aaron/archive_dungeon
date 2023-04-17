extends Position2D
export (PackedScene) var TarEnemy
export (PackedScene) var presidentattack
export (PackedScene) var attack2
export (PackedScene) var attack3
onready var player = $"../Player"
onready var attack = presidentattack
var rng = RandomNumberGenerator.new()

func get_target():
	if player:
		return player.position
	else:
		return Vector2.ZERO

func attack(target:Vector2):
	if attack==TarEnemy:
		attack2()
	if attack==presidentattack:
		attack1(target)
		
# Called when the node enters the scene tree for the first time.
func attack2():

	var bullet_instance = attack.instance()
	var target = get_global_mouse_position()
	
	get_parent().get_parent().add_child(bullet_instance)
	
	var randv = Vector2(rng.randf_range(-100,100), rng.randf_range(-100,100))
	
	#bullet_instance.position = randv
	bullet_instance.global_position = global_position + randv
	#bullet_instance.global_position = global_position
	
	
	
	
func attack1(target:Vector2):

	var bullet_instance = attack.instance()
	bullet_instance.set_direction(target)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position

func attack3(target:Vector2):
	var bullet_instance = attack2.instance()
	#target = global_position.direction_to(target).normalized()
	bullet_instance.set_direction(target)
	#bullet_instance.set_direction(target)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
func attack4():
	pass

func switch():
	match(attack):
		TarEnemy:
			attack = presidentattack
		presidentattack:
			attack = TarEnemy # Replace with function body.
			
func getphase():
	return attack
