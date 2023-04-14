extends Node2D

export (Vector2) var org = Vector2(0,0)
onready var cab = $cab
#onready var boss =$ "../../mrpresident"
var parent = get_parent()
#var boss = parent.get_parent()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var boss 


# Called when the node enters the scene tree for the first time.
func _ready():
	if parent:
		boss = parent.get_parent()
		org = parent.global_position # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the preious frame.
func _process(delta):
	parent = get_parent()
	if parent:
		boss=parent.get_parent()
		#org=parent.global_position
		org=parent.global_position
		self.position.x = parent.position.x *-1
		self.position.y = parent.position.y*-1
		#print(self.position)
	#cab.legacy.get_vertices()
#	print(cab.points.points)
	#print(cab.get_vertices())
	#cab.set_vertex(0,org)
	
	cab.set_point_position(0,parent.position)
	
	if boss:
		#return
		#cab.set_vertex(0,org)
		#cab.set_point_position(1,boss.global_position)
		#cab.set_point_position(1,boss.position.distance_to(self.position))
		cab.set_point_position(1,boss.global_position-self.global_position)
		#cab.set_point_position(1,boss.global_position-boss.position+self.global_position)
#
