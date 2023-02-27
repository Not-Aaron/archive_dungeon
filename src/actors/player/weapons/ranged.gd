extends Position2D
export (PackedScene) var Bullet
export (PackedScene) var Slice
onready var attack = Slice
	
# Called when the node enters the scene tree for the first time.
func shoot():
	var bullet_instance = attack.instance()
	var target = get_global_mouse_position()
	var direction_to_mouse = global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position

func switch():
	match(attack):
		Bullet:
			attack = Slice
		Slice:
			attack = Bullet
