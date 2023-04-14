extends Node2D
export (Vector2) var point_a
export (Vector2) var point_b
onready var rope = $Particles2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rope.process_material.set_gravity(Vector3(-1*point_b.x,-1*point_b.y,0))
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.global_position = point_a
	var ropcur = rope.process_material.angle_curve.get_curve()
	#set_point_value(index, y_value of 360)
	#have like several points that shape direction to position 2 
	# based on the calculated position of each individual partical
	# for like 50 particals 
	#recursive
	#gravity must curve this way too, have it do the negative of 
	#the vector 2 position you are going for
	rope.process_material.set_gravity(Vector3(-1*point_b.x,-1*point_b.y,0))
	#rope.process_material.angle.set_angle(rad2deg(point_a.angle_to(point_b)))
	#the angle with be subtracting 180 from the angle from a to b, from b to the origin.
	#rope.process_material.set_param("emission_angle", rad2deg(point_a.angle_to(point_b)))
	rope.process_material.angle= (180-rad2deg(point_a.angle_to(point_b))-rad2deg(Vector2(0,0).angle_to(point_b)))
	print(ropcur.get_point_count())
	#print(ropcur.)
	#sets curve points to direction2, normalized and in degrees
