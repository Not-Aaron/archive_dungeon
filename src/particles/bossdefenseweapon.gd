extends Position2D
export (PackedScene) var block
export (PackedScene) var zap
onready var player = $"../Player"
onready var attack = block
var rng = RandomNumberGenerator.new()

func get_target():
	if player:
		return player.position
	else:
		return Vector2.ZERO

func attack(target:Vector2):
	if attack==block:
		attack2()
	if attack==zap:
		attack1(target)
		
# Called when the node enters the scene tree for the first time.
func attack2():

	var bullet_instance = attack.instance()
	var target = get_global_mouse_position()
	
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
func attack1(target:Vector2):

	var bullet_instance = attack.instance()
	
	#var x = rng.randf_range(.9, 1.1)
	#var y = rng.randf_range(.9, 1.1)
	var x = rng.randf_range(-10, 10)
	var y = rng.randf_range(-10, 10)
	var randomtarg = Vector2(x,y) * target
	bullet_instance.set_direction(randomtarg)
	bullet_instance.set_direction(target)
	#bullet_instance.set_direction(target)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position


func switch():
	match(attack):
		block:
			attack = zap
		zap:
			attack = block
			
func getphase():
	return attack
