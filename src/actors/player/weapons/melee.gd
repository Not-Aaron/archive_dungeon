extends Position2D
export (PackedScene) var Slice

func shoot():
	var slice_instance = Slice.instance()
	var target = get_global_mouse_position()
	var direction_to_mouse = global_position.direction_to(target).normalized()
	slice_instance.set_rotation(direction_to_mouse.angle())
	get_parent().get_parent().add_child(slice_instance)
	slice_instance.global_position = global_position
