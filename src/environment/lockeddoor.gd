extends Area2D

export (PackedScene) var target
#export (Texture) var texture 
onready var player = $"../Player"
export (bool) var is_locked = true
#var file = File.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$AnimatedSprite.animation = "locked"
	$AnimatedSprite.play()  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
#file.open("user://saved_game.sav", File.WRITE)



func _on_dooranimation_timeout():
	#target.use_key()
	file.open("user://ssav", File.WRITE)
	get_tree().change_scene_to(target)
	$enter.play() # Replace with function body.


func _on_lockeddoor_body_entered(body: Node) -> void:
	if body == player:
		if player.check_key()==true or is_locked==false:
			$dooranimation.start()
			is_locked==false
			$AnimatedSprite.animation = "open"
		if player.check_key()==false and is_locked==true:
			$AnimatedSprite.animation = "denied"


func _on_lockeddoor_body_exited(body):
	if player.haskey==false:
		$AnimatedSprite.animation = "locked" # Replace with function body.
