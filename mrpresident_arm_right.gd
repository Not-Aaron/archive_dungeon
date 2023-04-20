extends Node2D
export (PackedScene) var weapon
export (float) var sprite = 0
#export (bool) var lor = false
export (float) var lor = 1
export (float) var speed = 2
var weapos
onready var player = $"../../Player"
var active = false
var rng = RandomNumberGenerator.new()
var org
#export (Vector2) var radius = Vector2(0,0)
export (float) var radius = 0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func activate(spawn:Vector2):
	
	active = true
	##self.global_position = spawn
	self.visible=true
	#while self.position != org:
	#	var gotoarm = self.position.direction_to(org) * speed
	#	self.position += gotoarm


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = str(lor)
	$AnimatedSprite.play()
	org = self.position
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active == false:
		self.visible=false
		self.global_position==Vector2(9999,9999)
		return
	var parent = get_parent()
	#print(parent)
#	print(position.direction_to(player.position))
	#speed = rng.randf_range(speed-1,speed+1)
	
	
	#var velocity = (position.direction_to(player.position) * speed) / (position.distance_squared_to(org)+1)
	#var velocity = (position.direction_to(player.position) * speed) / (position.distance_to(org)+1)
#	var velocity = (position.direction_to(player.position) * speed) - (position.distance_squared_to(org)+1)
	#var velocity = (position.direction_to(player.position) * speed) / (sqrt(position.distance_to(org)+1))
	var dist = abs(position.distance_to(org))
	#var dist = position.distance_to(org)
	var velocity = (position.direction_to(player.position) * speed) / (1+sqrt(dist+1)*sqrt(dist/radius)	)#velocity+= position.direction_to(org) / (sqrt(position.distance_to(org)+1))
	print(velocity)
	position+=velocity
	
	
	
	
	if parent:
		var weapos = parent.get_weapon(lor)
		parent.set_weapos(lor, self.global_position)
		#parent.get_weapon_r()
		#return
		
func take_damage(damage: float):
	var parent = get_parent()
	if parent:
		parent.take_damage()
		$AnimatedSprite.animation = "hit"
	
