extends Area2D

export (PackedScene) var target


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Teleporter_body_entered(body: Node) -> void:
	if body is Player:
		get_tree().change_scene_to(target)
		$enter.play()
		
