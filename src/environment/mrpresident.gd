extends Area2D

onready var player = $"../Player"
export var aggro_radius = 2000
export var speed = 0
var health = 200
var damage = 10
var max_health = 2000
var velocity = Vector2.ZERO
var defense = 0
onready var attack = $attack1
export (PackedScene) var target
onready var deathtimer = $deathtimer
onready var cooldowntimer = $cooldowntimer
onready var weapon = $weapon
onready var weapon2 = $weapon_p2_1
onready var weapon3 = $weapon_p2_2
onready var dead = false
onready var weaponrange = 1000
var rng = RandomNumberGenerator.new()
var actually_dead=false

export (PackedScene) var TarEnemy
export (PackedScene) var presidentattack
#export (float) var phase = 0
var curatt = 0
export (bool) var part_2=false
var phase
#need to have him target the player
func set_weapos(weap: bool, weapos:Vector2):
	if weap==true:
		weapon3.global_position=weapos
	else:
		weapon2.global_position=weapos
# Called when the node enters the scene tree for the first time.
func get_weapon(lor:bool):
	if lor==true:
		return weapon3
	else:
		return weapon2
func take_defense(taken:float):
	defense = defense+taken
	
func _ready() -> void:
	if not phase:
		if part_2==true:
			phase=1
		else:
			phase=0
			$spr1.visible = true
			$spr2.visible = false
			
	cooldowntimer.start()
	$coold2.start()
	if part_2==true:
		#phase = 1
		defense =9
		health -= 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
#	
	if dead == true:
		$AnimatedSprite.animation = "die"
		return

	#if (cooldowntimer.time_left <= 0):
		
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
	
	if phase ==1:
		$AnimatedSprite.animation = "phase2"
		speed=50
		
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
	if defense < 8:
		return
	health -= damage
	$AnimatedSprite.animation = "hit"
	if health <= 0 and dead == false:
		die()

func die():
	
	deathtimer.start()
	if phase == 0:
		$AnimatedSprite.animation = "die"
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation = "die2" #will be new die animation
		$AnimatedSprite.play()
	dead = true
	#get_tree().change_scene_to(target)
	#var parttwo = $"../mrpresident_part_2"
	#parttwo.init()
func attack():

		
		var target = Vector2(rand_range((self.position.x - weaponrange),(self.position.x + weaponrange)), rand_range((self.position.y - weaponrange),(self.position.y + weaponrange)))
		#var target = Vector2(rand_range(-999,999), rand_range(-999,999))
		weapon.attack(target)
func attack2():
	if phase == 1:
		
			weapon2.attack3(player.position)
			weapon3.attack(player.position)
			
			
			
###phase change###
func change_phase():
	if phase == 0:
		health = 2000	
		dead = false
		phase= phase+1
		$left.activate(self.global_position)
		$right.activate(self.global_position)
		$spr2.visible = true
		$spr1.visible = false
		
	
		return
	elif health <= 0:
		actually_dies()
	
	
func _on_deathtimer_timeout():
	change_phase()
	#queue_free() 
	
func actually_dies():
	actually_dead==true
	var p = get_parent()
	p.endtime_start()
	queue_free()
		


func _on_attack2_timeout():
	if attack == $attack1:
		attack = $attack2
		attack.start()
	if attack == $attack2:
		attack = $attack1
		attack.start() 


func _on_attack1_timeout():
	
	if attack == $attack1:
		attack = $attack2
		attack.start()
	if attack == $attack2:
		attack = $attack1 
		attack.start()


func _on_cooldowntimer_timeout():
	
	attack()
	#if (weapon.getphase()==TarEnemy):
	#if attack == $attack1:
	if curatt == 1:
		 cooldowntimer.set_wait_time(5)
	
	#if (weapon.getphase()==presidentattack):
	#if attack == $attack2:
	if curatt == 0:
		 cooldowntimer.set_wait_time(.5)
	
	cooldowntimer.start()
	
func _on_phase_timeout():
	if curatt == 1:
		curatt = 0
	else:
		curatt = 1
	weapon.switch() 
	$phase.start()


func _on_coold2_timeout():
	attack2()
	$coold2.start() 
