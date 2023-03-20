extends Area2D

onready var player = $"../Player"

var health = 20
var max_health = 20
var velocity = Vector2.ZERO

onready var deathtimer = $deathtimer
onready var cooldowntimer = $cooldowntimer
onready var weapon = $weapon
onready var dead = false
## Add something that randomly selects which sprite it will be for randomizations
export (PackedScene) var TarEnemy
export (PackedScene) var presidentattack


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if dead == true:
		$AnimatedSprite.animation = "die"
		return
	else:
		$AnimatedSprite.animation = "idle1"
	

# Damage player upon collision
	
func take_damage(damage: float):
	health -= damage
#	$AnimatedSprite.animation = "hit"
	if health <= 0 and dead == false:
		die()

func die():	
	deathtimer.start()
	$AnimatedSprite.animation = "die"
	$AnimatedSprite.play()
	dead = true
	
func _on_deathtimer_timeout():
	queue_free() # Replace with function body.
	# Replace with function body.