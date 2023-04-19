extends Node2D

export (Vector2) var org = Vector2(0,0)
export (bool) var droop = true
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
	#if not cab.get_point(9):
	while cab.get_point_count()<(p+1):
		cab.add_point(Vector2(0,0))
		
	
	cab.set_point_position(0,parent.position)
	cab.set_point_position(1,parent.position)
	
	if boss:
		#return
		#cab.set_vertex(0,org)
		#cab.set_point_position(1,boss.global_position)
		#cab.set_point_position(1,boss.position.distance_to(self.position))
		cab.set_point_position(p,boss.global_position-self.global_position)
		
	#triangle
	#cab.set_point_position(9,boss.global_position-self.global_position)
		#cab.set_point_position(1,boss.global_position-boss.position+self.global_position)
	if droop == false:
		for i in range(2,(p+1)):
			var dipos = (cab.get_point_position(1))
		#print(dipos)
		#print(dipos)
		#var ful = dipos-org
			var ful = dipos
			var y_intrv=ful.y/p
			var x_intrv=ful.x/p
			var point = Vector2(x_intrv*((p+1)-i), y_intrv*((p+1)-i))
			cab.set_point_position(i,point)
		return
	for i in range(2,(p+1)):
		#have ti droop relative to gravity. Assuming real gravit,y and our perspect is top down at about a 45 degree angle, this means that 
		#the gravity should appear as some x,y position scaled down with the top down perspective, versus us looking at it from 0 and seeing the gravity 
		# vertically with z. 
		# 
		
		
			
		#var dist = boss.global_position.distance_to(self.global_position)
		
		var dist = boss.position.distance_to(self.position)
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
		#var height = 
		#var h_grav = height - height/abs(25-(i*i))
		#var h_grav = height - height*abs(25/(i*i))
		#var h_grav = sqrt(height*height - height*height*abs(25-(i*i)))
		#var h_grav = height-(height/abs(5-i))
		#var h_grav = height/(abs(m-i)+1)
		#var h_grav = (i-m)*(i-m)
		var h_grav = ((i-m)*(i-m)-20)
	#	var h_grav=0
		#print(i, h_grav)
		
		#var point = Vector2(x_intrv*((p+1)-i), y_intrv*((p+1)-i) + h_grav)
		var point = Vector2(x_intrv*((p+1)-i), y_intrv*((p+1)-i) + h_grav)
		#var grav = (dipos/(i*i))
		if i==10:
			cab.set_point_position(0,point)
			return
		cab.set_point_position(i,point)
		#cab.set_point_position(i, boss.global_positiomn-self.global_position-
	if g!=1:
		#print(cab.get_vertices())
		#for h in range(0,10):
			#print(h)
			#print(cab.get_point_position(h))
		#print(h_grav)
		g+=1
