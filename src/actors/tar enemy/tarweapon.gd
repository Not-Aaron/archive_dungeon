extends Position2D

export (PackedScene) var Tar
onready var player = $"../Player"
onready var attack = Tar 

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
##func _ready() -> void:
	##pass # Replace with function body.

##func _process(delta: float) -> void:
	##if not is_instance_valid(player):
		#velocity = Vector2.ZERO
		#$AnimatedSprite.stop()
		##return
	#$AnimatedSprite.animation = "move"
	#$AnimatedSprite.play()
	#velocity = speed*position.direction_to(player.position)
	#position += velocity * delta
	##shoot()
	
func shoot(target:Vector2):
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
