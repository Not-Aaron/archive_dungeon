extends Node2D
export (PackedScene) var start_level

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _unhandled_input(event: InputEvent):
	#if event.is_action()==true:
	#	get_tree().change_scene_to(start_level)
		#change scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene_to(start_level) # Replace with function body.
