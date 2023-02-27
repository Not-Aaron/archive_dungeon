extends TextureRect
export(PackedScene) var fly_enemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MobTimer.start() 
	get_tree().call_group("mobs","queue_free")
	$Player.connect("player_fired_bullet",bullet_manager,"handle_bullet_spawned") # Replace with function body.
	$music.play()
	$StartTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MobTimer_timeout():
	
	var mob = fly_enemy.instance()
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	#var mob_spawn_location = (0,0)
	mob_spawn_location.offset = randi()
	
	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	
	direction += rand_range(-PI/4,PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(rand_range(150.0,250.0),0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	
onready var bullet_manager = $BulletManager # Replace with function body.


func _on_StartTimer_timeout():
	$MobTimer.start()
	#$ScoreTimer.start() # Replace with function body.
