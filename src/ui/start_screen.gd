extends Node2D
export (PackedScene) var start_level



func _on_StartButton_pressed() -> void:
	get_tree().change_scene_to(start_level)




