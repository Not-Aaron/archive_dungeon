extends Position2D

export (PackedScene) var Tar
onready var player = $"../Player"
onready var attack = Tar 

var rng = RandomNumberGenerator.new()

func take_tar(ntar: PackedScene):
	if ntar:
		Tar = ntar
		#print(Tar)
func _ready():
	var parent = get_parent()
	if parent.tar:
		Tar = parent.tar
	
func shoot(target:Vector2):
	print(Tar)
	###if not is_instance_valid(player):
		###return
	var bullet_instance = attack.instance()
	#target player!
	#var target = player.position
	#var direction_to_mouse = global_position.direction_to(target).normalized()
	#bullet_instance.set_direction(direction_to_mouse)
	#var my_random_number = rng.randf_range(.5, 1.5)
#	var spray = target * my_random_number
	var rng1 = rng.randf_range(.9,1.1)
	var rng2 = rng.randf_range(.9,1.1)
	var randomvector = Vector2(rng1,rng2)
	var newtarget = target * randomvector
	bullet_instance.set_direction(newtarget)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
