extends Area2D
var is_on = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_on == true:
		$AnimatedSprite.animation = "on"
	if is_on == false:
		$AnimatedSprite.animation = "off"



func get_on():
	return is_on

func _on_switch_body_entered(body):
	if body.is_in_group("weapon"):
		is_on=true


func _on_switch_area_entered(area):
	if area.is_in_group("weapon"):
		is_on=true # Replace with function body.
