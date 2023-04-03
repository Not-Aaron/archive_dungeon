extends Node



# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


class Default:

	const speed = 500.0
	
	static func calculate_move_velocity(
		velocity: Vector2,
		direction: Vector2
	) -> Vector2:
		
		return direction.normalized()*speed
		
		
