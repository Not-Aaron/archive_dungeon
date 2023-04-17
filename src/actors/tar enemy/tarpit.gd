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
onready var tarshape = $tarshape
var rng = RandomNumberGenerator.new()
var lastx
var lasty
var x
var y
var nx
var ny
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var origin = Vector2.ZERO
var point = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	ans.animation = "growing"
	$growing.start()
	$respawn.start() # Replace with function body.
	x = rng.randf_range(-100,100)
	y = rng.randf_range(-100,100)
	origin = (Vector2(x,y))
	point = (Vector2(x,y))
	for c in range(0,18):
		
		if c<6:
			x=rng.randf_range(-20*c, point.x)
			y = rng.randf_range(-20*c,point.y)
		if c>6 and c<13:
			x=rng.randf_range(point.x,20*(c-6))
			y=rng.randf_range(-20*(c-6),point.y)
		if c>13 and c<16:
			x=rng.randf_range(point.x,(20*(c-13)))
			y = rng.randf_range(point.y,20*(c-13))
		if c>16:
			x=rng.randf_range(-20*(c-16),point.x)
			y = rng.randf_range(point.y,20*(c-16))
			
		
		point = Vector2(x,y)
	#	if point.x
		#if lastx < 0:
		#	var x = rng.randf_range(,500)
		##	var y = rng.randf_range()
		
		#var point = Vector2(rng.randf_range(-500,500),rng.randf_range(-500,500))
		
		
		lastx=point.x
		lasty=point.y
		tarshape.set_point_position(c,point)

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
