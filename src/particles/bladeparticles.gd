extends Node2D
export (Vector2) var direction = Vector2.ZERO
onready var sparks = $sparks
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _process(delta):
	pass
#	var parent = get_parent()
	
#	direction = parent.curd
#	
#	direction.x = direction.x*-100
#	direction.y=direction.y*-100
#	print(direction)
#	sparks.process_material.set_gravity(Vector3(direction.x,direction.y,0))
#func set_direction(direction: Vector2)
#	sparks.set_gravity(direction)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	sparks.set_emitting(true) # Replace with function body.
	#####make sure rotates with the sword so that it has a swing and doesnt go in straight line!
	#var parent = get_parent()
	
	#direction = parent.curd
	
	#direction.x = direction.x*-100
	#direction.y=direction.y*-100
	#print(sparks.process_material.get_gravity())
	#print(direction)
	#sparks.process_material.set_gravity(Vector3(direction.x,direction.y,0))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
