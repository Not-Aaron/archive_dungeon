extends Area2D
onready var respawn = $respawn
export (PackedScene) var tarenemy 
export (PackedScene) var tar
onready var ans = $AnimatedSprite
var health = 100
#buffed from 10
var max_health = 100
var dead = false
onready var deathtimer = $deathtimer
onready var player = $"../Player"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ans.animation = "growing"
	$growing.start()
	$respawn.start() # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_respawn_timeout():
	var taren = tarenemy.instance()
	get_parent().add_child(taren)
	taren.take_tar(tar)
	taren.global_position = global_position
	$respawn.start()


func _on_growing_timeout():
	ans.animation = "default" # Replace with function body.

func take_damage(damage: float):
	health -= damage
	if health <= 0 and dead == false:
		die()
		
	if health >= 0 and dead==false:
		$AnimatedSprite.animation = "hit"
		$AnimatedSprite.play()
		
func die():
	
	deathtimer.start()
	$AnimatedSprite.animation = "die"
	$AnimatedSprite.play()
	dead = true
	player.take_credentials(1)
	#queue_free()
	


func _on_deathtimer_timeout():
	queue_free() # Replace with function body.
