extends Position2D

export (PackedScene) var burst
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func shoot(target: Vector2):
	var bullet = burst.instance()
	#var bullet_instance = attack2.instance()
	#target = global_position.direction_to(target).normalized()
	bullet.set_direction(target)
	#bullet_instance.set_direction(target)
	get_parent().get_parent().add_child(bullet)
	bullet.global_position = global_position
