extends Area2D

onready var player = $"../Player"
onready var blood = $stardustbloodparticles
export var aggro_radius = 500
export var speed = 100
var health = 100
var damage = 10
var max_health = 100
var velocity = Vector2.ZERO
onready var dead = false

onready var deathtimer = $deathtimer
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if dead == true:
		$AnimatedSprite.animation = "die"
		return
	if not is_instance_valid(player) or position.distance_to(player.position) > aggro_radius or health <= 0:
		if $light.get_energy() >= 0:
			$light.set_energy($light.get_energy()-delta)
		velocity = Vector2.ZERO
		$sound.stop()
		if health <= 0:
			return
		$AnimatedSprite.stop()
		return
	if $sound.is_playing() != true:
		$sound.play()
	if $light.get_energy() <= 1:
		$light.set_energy($light.get_energy()+delta)
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()
	velocity = speed*position.direction_to(player.position)
	#$Particles2D.gravity(velocity.x,velocity.y)
	#$Paritcles2d
#	have gravity follow behind ghosts
	position += velocity * delta
	

# Damage player upon collision
func _on_FlyingEnemy_body_entered(body: Node) -> void:
	if body == player:
		$AnimatedSprite.animation = "attack"
		if player.vulnerable:
			player.take_damage(damage)
	
func take_damage(damage: float):
	health -= damage
	if health >= 0:
		blood.parent_hit()
		$AnimatedSprite.animation = "hit"
		$AnimatedSprite.play()
		$hit.play()
	if health <= 0 and dead == false:
		die()
		
		
func die():
	deathtimer.start()
	$AnimatedSprite.animation = "die"
	$AnimatedSprite.play()
	
	dead = true
	player.take_credentials(1)

func _on_deathtimer_timeout():
	queue_free() # Replace with function body.
