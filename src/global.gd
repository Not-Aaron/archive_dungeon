extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func change_level(level_old: Node, level_new: PackedScene):
	var level_instance = level_new.instance()
	var parent = level_old.get_parent()
	parent.add_child(level_instance)
	level_old.get_node("Player").change_parent(level_instance)
	parent.remove_child(level_old)
	
