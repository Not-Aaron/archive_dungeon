extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.connect("player_fired_bullet",bullet_manager,"handle_bullet_spawned") # Replace with function body.

onready var bullet_manager = $BulletManager
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
