extends KinematicBody2D
class_name Player
onready var weapon = $weapon
var clearance = 0
#maybe the clearance requirement should all be taken from what the level scene is. For instance lock doors are not manually entered credentials but taken from the level.
export (float) var clearance_requirement = 0
###export (PackedScene) var blood
onready var blood = $bloodparticles
var health = 100
var max_health = 100
var vulnerable = true
onready var slowtimer = $slowtimer
var isslowed = false
var isblinded = false
export(String, FILE, "*.tscn") var path_to_start
#const physics = preload("physics.gd")
const physics = preload("physics.gd")
var physicsType = physics.Default
var velocity = Vector2.ZERO
#onready var haskey=false
onready var haskey=false
func _ready():
	$AnimatedSprite.animation = "idle"
	
func _physics_process(_delta: float) -> void:
	#print(isslowed)
	
	if isblinded == true:
		$extradarkness.visible = true	
	if isblinded == false:
		$extradarkness.visible = false
		
	if isslowed == true:
		#print(velocity)
		var newvelocity = velocity 
		newvelocity.x = velocity.x * 0.1 #* slow
		newvelocity.y = velocity.y * 0.1
		#print(newvelocity)
		#print(haskey)
		#print(velocity)
		velocity = move_and_slide(physicsType.calculate_move_velocity(newvelocity, get_direction())) * 0.1
	else:
		
		velocity = move_and_slide(physicsType.calculate_move_velocity(velocity, get_direction()))
	
	if velocity.length() > 0:
		#velocity = velocity.normalized() * 3
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		if velocity.y < 0:
			$AnimatedSprite.animation = "up"
		else:
			$AnimatedSprite.animation = "down"
	
		#$AnimatedSprite.flip_v = velocity.y > 0

func get_direction() -> Vector2:
#	if isslowed == true:
#		var input=Vector2(Input.get_action_strength("move_right")-Input.get_action_strength("move_left"), Input.get_action_strength("move_down")-Input.get_action_strength("move_up"))
#		var slow = Vector2(0.5,0.5)
#		print(isslowed)
#		return input*slow
	return Vector2(Input.get_action_strength("move_right")-Input.get_action_strength("move_left"), Input.get_action_strength("move_down")-Input.get_action_strength("move_up"))
func _input(event):
	pass
	#if event is InputEventMouseButton:
		#weapon.shoot()
func _unhandled_input(event: InputEvent):
	if event.is_action_released("shoot"):
		weapon.shoot()
	if event.is_action_released("switch"):
		weapon.switch()
func take_credentials(creds: float):
	clearance += 1	
func take_damage(damage: float):
	if not vulnerable:
		return
	health -= damage
	blood.parent_hit()
	$hittimer.start()
	
	$hit.play()
	
	if health <= 0:
		die()
	else:
		vulnerable = false
		$IFrameTimer.start()
		
func take_slow():
	if isslowed == false:
		slowtimer.start()
	#print(isslowed)
	#if not vulnerable:
	#	return
		isslowed = true 
	#if health <= 0:
	#	die()
	#else:
	#	vulnerable = false
	#	$IFrameTimer.start()
		
func take_blind():
	if isblinded == false:
		$blindtimer.start()
		isblinded = true
func take_key():
	haskey = true
	$AnimatedSprite.animation = "retrieve"

func use_key():
	haskey = false	
	$AnimatedSprite.animation = "useitem"	
	
func check_key():
	if haskey==true:
		return true
	if haskey==false:
		return false
	#return haskey
		
func die():
	#hide()
	queue_free()
	get_tree().change_scene(path_to_start)
	#emit_signal("hit") #unhandled signal
	# show game over screen
	
func change_parent(new_parent: Node):
	get_parent().remove_child(self)
	new_parent.add_child(self)
	position = new_parent.get_node("StartPos").position

func _on_IFrameTimer_timeout() -> void:
	vulnerable = true # Replace with function body.


func _on_slowtimer_timeout():
	 isslowed=false # Replace with function body.
	 isslowed=false # Replace with function body.


func _on_hittimer_timeout():
	$hit.stop()# Replace with function body.

func get_credentials():
	return clearance


func _on_blindtimer_timeout():
	isblinded = false # Replace with function body.
