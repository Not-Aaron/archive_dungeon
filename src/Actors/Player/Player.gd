extends KinematicBody2D
class_name Player

const physics = preload("physics.gd")
var physicsType = physics.Default
var velocity = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	print(physicsType.calculate_move_velocity(velocity, get_direction()))
	velocity = move_and_slide(physicsType.calculate_move_velocity(velocity, get_direction()))

func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right")-Input.get_action_strength("move_left"), Input.get_action_strength("move_down")-Input.get_action_strength("move_up"))

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
