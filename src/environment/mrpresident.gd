extends Area2D

onready var player = $"../Player"
export var aggro_radius = 500
export var speed = 0
var health = 200
var damage = 10
var max_health = 200
var velocity = Vector2.ZERO
onready var attack = $attack1
#onready var attack = Beam
onready var deathtimer = $deathtimer
onready var cooldowntimer = $cooldowntimer
onready var weapon = $weapon
onready var dead = false

export (PackedScene) var TarEnemy
export (PackedScene) var presidentattack
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#attack.start() # Replace with function body.
	#$phase.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if dead == true:
		$AnimatedSprite.animation = "die"
		return
	
	
	if (cooldowntimer.time_left <= 0):
			if (weapon.getphase()==TarEnemy):
				 cooldowntimer.set_wait_time(1)
				 cooldowntimer.start()
			if (weapon.getphase()==presidentattack):
				 cooldowntimer.set_wait_time(0.05)
				 cooldowntimer.start()
	if ($phase.time_left <=0):
			$phase.start()
	if not is_instance_valid(player) or position.distance_to(player.position) > aggro_radius or health <= 0:
		velocity = Vector2.ZERO
		$sound.stop()
		if health <= 0:
			return
		
		$AnimatedSprite.stop()
		return
	if $sound.is_playing() != true:
		$sound.play()
	
	$AnimatedSprite.animation = "walk"
	$AnimatedSprite.play()
	velocity = speed*position.direction_to(player.position)
	position += velocity * delta
	

# Damage player upon collision
func _on_FlyingEnemy_body_entered(body: Node) -> void:
	if body == player:
		$AnimatedSprite.animation = "attack"
		if player.vulnerable and dead==false:
			player.take_damage(damage)
	
func take_damage(damage: float):
	health -= damage
	$AnimatedSprite.animation = "hit"
	if health <= 0 and dead == false:
		die()
		
		
		
func die():
	
	deathtimer.start()
	$AnimatedSprite.animation = "die"
	$AnimatedSprite.play()
	dead = true
func attack():
	#if attack == $attack1:
		
	#	weapon.attack1(player.position)
	
	#if attack == $attack2:
		
		#weapon.attack2()
		#var target = position.distance_to(player.position)
		var target = player.position
		weapon.attack(target)
	
func _on_deathtimer_timeout():
	queue_free() # Replace with function body.


func _on_attack2_timeout():
	if attack == $attack1:
		attack = $attack2
		attack.start()
	if attack == $attack2:
		attack = $attack1
		attack.start() # Replace with function body.


func _on_attack1_timeout():
	
	if attack == $attack1:
		attack = $attack2
		attack.start()
	if attack == $attack2:
		attack = $attack1 
		attack.start()# Replace with function body.


func _on_cooldowntimer_timeout():
	#if attack.time_left<=0:
		#attack.start()
	attack()
	# Replace with function body.




func _on_phase_timeout():
	weapon.switch() # Replace with function body.
	$phase.start()
