extends Area2D

export (PackedScene) var target


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite.animation = "locked"
	$AnimatedSprite.play()  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Teleporter_body_entered(body: Node) -> void:
	if body is Player:
		if target.haskey==true:
			$dooranimation.start()
			$AnimatedSprite.animation = "open"
		else:
			$AnimatedSprite.animation = "denied"
		


func _on_dooranimation_timeout():
	get_tree().change_scene_to(target)
	$enter.play() # Replace with function body.


func _on_lockeddoor_body_entered(body):
	pass # Replace with function body.


func _on_lockeddoor_body_exited(body):
	if target.haskey==false:
		$AnimatedSprite.animation = "locked" # Replace with function body.
