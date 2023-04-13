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
		direction: Vector2,
		isattacking: bool,
		isslow: bool,
		attacktimer: float
		
	) -> Vector2:
		var i = 1
		if isattacking == true:
			#i = i*5*(attacktimer/0.1)
			#lunge that slows down to stop over period of attack
			i = i*2*(attacktimer/0.1)
		if isslow == true:
			i-=.5
		#return direction.normalized()*speed
		return direction.normalized()*speed*i
		
		
