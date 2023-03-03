extends Position2D

export (PackedScene) var Eye
onready var player = $"../Player"
onready var attack = Eye 
	
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
	bullet_instance.set_direction(target)
	get_parent().get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
