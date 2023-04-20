extends Node2D

export (Vector2) var org = Vector2(0,0)
export (Vector2) var dest = Vector2(0,0)
export (bool) var droop = true
export (bool) var disowned = false
onready var cab = $cab
#onready var boss =$ "../../mrpresident"
var parent = get_parent()
#var boss = parent.get_parent()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var boss 
var g =0
var p=20
func get_info():
	var points = str(cab.get_vertices())
	
	var pointkeys = "poop"
	#for q in cab.get_vertices():
	for q in cab.get_point_count():
		
		print(q, " ", cab.get_point_position(q))
		#pass
	return  points+"  "+pointkeys
	

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	if parent:
		boss = parent.get_parent()
		org = parent.global_position # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the preious frame.
func _process(delta):
	parent = get_parent()
	v_adoption(disowned)
	droop(droop)


func v_adoption(disown: bool):
	while cab.get_point_count()<(p+1):
		cab.add_point(Vector2(0,0))
	if disown == true:
		cab.set_point_position(0,org)
		cab.set_point_position(1, org)
		cab.set_point_position(p,dest-self.global_position)
		return
	if parent:
		boss=parent.get_parent()

		org=parent.global_position
		self.position.x = parent.position.x *-1
		self.position.y = parent.position.y*-1

		
	
	cab.set_point_position(0,parent.position)
	cab.set_point_position(1,parent.position)
	
	if boss:
		cab.set_point_position(p,boss.global_position-self.global_position)
	
func droop(drop: bool):
	if drop == false:

		for i in range(2,(p+1)):
			var dipos = (cab.get_point_position(1))
			var ful = dipos
			var y_intrv=ful.y/p
			var x_intrv=ful.x/p
			var point = Vector2(x_intrv*((p+1)-i), y_intrv*((p+1)-i))
			cab.set_point_position(i,point)
		return
	for i in range(2,(p+1)):
		var dist
		if disowned==true:
			dist = dest.distance_to(self.position)
		else:
			dist = boss.position.distance_to(self.position)
		#print(dist)
		
		#var dipos = (cab.get_point_position(9))
		var dipos = (cab.get_point_position(1))
		#print(dipos)
		#print(dipos)
		#var ful = dipos-org
		var ful = dipos
		var y_intrv=ful.y/p
		var x_intrv=ful.x/p
		var height = dist / 20
		var m = (p+1)/2
		var h_grav = ((i-m)*(i-m)-20)
		var point = Vector2(x_intrv*((p+1)-i), y_intrv*((p+1)-i) - h_grav)

		if i==(p+1):
			#cab.set_point_position(0,point)
			return
		cab.set_point_position(i,point)
	
	if g!=1:
		g+=1
