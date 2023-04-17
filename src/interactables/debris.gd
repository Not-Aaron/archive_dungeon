extends Area2D

onready var player = $"../Player"

export (float) var health = 200
var max_health = 200
var damage = 10
var velocity = Vector2.ZERO
var weaponrange = 10
onready var deathtimer = $deathtimer
export (PackedScene) var zap
export (PackedScene) var block

onready var cooldowntimer = $cooldowntimer
onready var weapon = $bossdefenseweapon
onready var dead = false


## Add something that randomly selects which sprite it will be for randomizations
#export (PackedScene) var presidentattack
#export (PackedScene) var respawndebris
#onready var die  = "t"
#onready var idle = "z"
var rng = RandomNumberGenerator.new()
var x = rng.randi_range(0, 1)
#onready var die = "die" + String(x)
#onready var idle = "idle" + String(x)
var die= "die1"
var idle = "idle1"
#if (x>=0.51):
#	var idle = "idle1"
#	var die = "die1"
#if (x<=0.5):
#	var idle = "idle2"
#	var die = "die2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var die = "die" + String(x)
	var idle = "idle" + String(x)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	
	if dead == true:
		$AnimatedSprite.animation = die
		return
	else:
		$AnimatedSprite.animation = idle
	

# Damage player upon collision
	
func take_damage(damage: float):
	health -= damage
#	$AnimatedSprite.animation = "hit"
	if health <= 0 and dead == false:
		die()

func die():	
	deathtimer.start()
	$AnimatedSprite.animation = die
	$AnimatedSprite.play()
	dead = true
	
func _on_deathtimer_timeout():
	$regen.start()
	queue_free() # Replace with function body.
	


	
	

func _on_regen_timeout():
	#reloads scene, need to make the debris scene somethign that spawns the debris itself
	#pass # Replace with function body.
	pass
	#respawndebris.instance()
