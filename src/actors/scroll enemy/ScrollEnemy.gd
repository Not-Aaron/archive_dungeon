extends Area2D

onready var player = $"../Player"
onready var weapon = $weapon
export var aggro_radius = 500
export var speed = 200
var health = 20
var damage = 10
var max_health = 20
var velocity = Vector2.ZERO
var attackdmg = 5
onready var cooldowntimer = $attackcooldown
onready var deathtimer = $deathtimer
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooldowntimer.start()
	#pass
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	#cooldowntimer.start()
	if (cooldowntimer.time_left <= 0):
		cooldowntimer.start()
	if not is_instance_valid(player) or position.distance_to(player.position) > aggro_radius or health <= 0:
		cooldowntimer.stop()
		velocity = Vector2.ZERO
		if health <= 0:
			return
		$AnimatedSprite.stop()
		#cooldowntimer.stop()
		return
	#cooldowntimer.start()
	$AnimatedSprite.animation = "move"
	$AnimatedSprite.play()
	velocity = speed*position.direction_to(player.position)
	position += velocity * delta
	#implement attack cooldown
	#attack(attackdmg)
	
# Damage player upon collision

func attack(attack:float):
	#weapon._ready()
	weapon.shoot(player.position)
	
	
func take_damage(damage: float):
	health -= damage
	if health <= 0:
		die()
		
func die():
	deathtimer.start()
	$AnimatedSprite.animation = "die"
	$AnimatedSprite.play()
	
	#queue_free()
	
func _on_attackcooldown_timeout():
	attack(attackdmg)
	#queue_free()
	#pass()


func _on_ScrollEnemy_body_entered(body):
	if body == player:
		if player.vulnerable:
			$AnimatedSprite.animation = "attack"
			player.take_damage(damage) # Replace with function body.


func _on_ScrollEnemy_body_exited(body):
	$AnimatedSprite.animation = "move" # Replace with function body.


func _on_deathtimer_timeout():
	queue_free() # Replace with function body. # Replace with function body.
