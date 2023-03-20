extends Area2D
onready var player = $"../Player"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "idle"
	$AnimatedSprite.play() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_key_body_entered(body):
	if body == 'player':
		$animation.start()
		$AnimatedSprite.animation = "retrieved"
		player.take_key() # Replace with function body.


func _on_animation_timeout():
	queue_free() # Replace with function body.
