extends Node2D
export (Vector2) var point_a
export (Vector2) var point_b
onready var rope = $Particles2D
onready var boss = $"../mrpresident"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#rope.process_material.set_gravity(Vector3(-1*point_b.x,-1*point_b.y,0))
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(boss.position)
	if (not boss):
		return
	point_b = boss.global_position
	
	
	#rope.process_material.set_gravity(Vector3(-1*point_b.x,-1*point_b.y,0))
	self.global_position = point_a
	rope.process_material.set_gravity(Vector3(-1*point_b.x,-1*point_b.y,0))
	
	
	var ang = rad2deg((global_position.direction_to(point_b)).angle())
	var ropcur = rope.process_material.angle_curve.get_curve()
	ropcur.set_point_value(1,ang)
	#set_point_value(index, y_value of 360)
	#have like several points that shape direction to position 2 
	# based on the calculated position of each individual partical
	# for like 50 particals 
	#recursive
	#gravity must curve this way too, have it do the negative of 
	#the vector 2 position you are going for
	#rope.process_material.set_gravity(Vector3(-1*point_b.x,-1*point_b.y,0))
	#rope.process_material.angle.set_angle(rad2deg(point_a.angle_to(point_b)))
	#the angle with be subtracting 180 from the angle from a to b, from b to the origin.
	#rope.process_material.set_param("emission_angle", rad2deg(point_a.angle_to(point_b)))
	#self.position = point_a
	rope.process_material.angle = (90+ang)
	

	#sets curve points to direction2, normalized and in degrees
