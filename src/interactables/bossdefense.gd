extends Area2D

onready var player = $"../../Player"

export (float) var health = 200
export (float) var max_health = 200
var damage = 10
var velocity = Vector2.ZERO
var weaponrange = 10
onready var deathtimer = $deathtimer
export (PackedScene) var zap
export (PackedScene) var block
#var parent = get_parent()
onready var cooldowntimer = $cooldowntimer
onready var weapon = $bossdefenseweapon
onready var dead = false
var target = Vector2.ZERO


## Add something that randomly selects which sprite it will be for randomizations
#export (PackedScene) var presidentattack
#export (PackedScene) var respawndebris
#onready var die  = "t"
#onready var idle = "z"
var rng = RandomNumberGenerator.new()
var x = rng.randi_range(0, 1)
onready var die = "die" + String(x)
onready var idle = "idle" + String(x)

#if (x>=0.51):
#	var idle = "idle1"
#	var die = "die1"
#if (x<=0.5):
#	var idle = "idle2"
#	var die = "die2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$cooldowntimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	
	if dead == true:
		$AnimatedSprite.animation = die
		return
	else:
		$AnimatedSprite.animation = idle
	
	#self.
# Damage player upon collision
	
func take_damage(damage: float):
	health -= damage
#	$AnimatedSprite.animation = "hit"
	if health <= 0 and dead == false:
		die()

func die():	
	var parent = get_parent()
	parent.take_defense(1)
	deathtimer.start()
	$AnimatedSprite.animation = die
	$AnimatedSprite.play()
	dead = true
	
func _on_deathtimer_timeout():
	$regen.start()
	queue_free() # Replace with function body.
	

func _on_cooldowntimer_timeout():
	attack()
	var rand = rng.randf_range(3, 5)
	cooldowntimer.set_wait_time(rand)
	cooldowntimer.start()
	
	
	
func attack():
#	target = player.global_position 
	#target.x -= self.position.x*-1
#	target.y -= self.position.y*-1
	#target = self.position.x*-1
	
	#var target = Vector2.ZERO
	
		#var target = Vector2(rand_range(-999,999), rand_range(-999,999))
	for m in range(0,6):
		var angl = PI/6 + (m * PI/3)
		var target = Vector2(cos(angl),sin(angl))
	#	burst.shoot(Vector2(cos(angl),sin(angl)))
		weapon.attack(target)
		
func _on_regen_timeout():
	#reloads scene, need to make the debris scene somethign that spawns the debris itself
	#pass # Replace with function body.
	pass
	#respawndebris.instance()
