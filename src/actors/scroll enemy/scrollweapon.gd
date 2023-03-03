extends Position2D
onready var player = $"../Player"
export (PackedScene) var Bullet
export (PackedScene) var Slice
onready var attack = Slice
	
# Called when the node enters the scene tree for the first time.
func shoot():
	var bullet_instance = attack.instance()
	#target player!
	var target = player.global_position
	var direction_to_mouse = global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
