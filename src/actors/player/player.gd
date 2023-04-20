extends KinematicBody2D
class_name Player
onready var weapon = $weapon
export(PackedScene) var Slice
export (bool) var godmode = false
export (bool) var killswitch = false
var clearance = 0
#maybe the clearance requirement should all be taken from what the level scene is. For instance lock doors are not manually entered credentials but taken from the level.
export (float) var clearance_requirement = 0
###export (PackedScene) var blood
onready var blood = $bloodparticles
var health = 100
var max_health = 100
var vulnerable = true
onready var slowtimer = $slowtimer
onready var attacktimer = $attacktimer
var isslowed = false
var isblinded = false
export(String, FILE, "*.tscn") var path_to_start
#const physics = preload("physics.gd")
const physics = preload("physics.gd")
var physicsType = physics.Default
var velocity = Vector2.ZERO
var isattacking = false
#onready var haskey=false
onready var haskey=false
onready var dashtimer=$dashtimer
var dash = 0
var udash = 0
var ddash=0
var rdash=0
var ldash=0
var rng = RandomNumberGenerator.new()
var dashinv = false
var candash=true


func critical_land(pos: Vector2):
	weapon.critical_land(pos)
func _ready():
	$dashfl.visible = false
	$dodge.emitting=false
	$AnimatedSprite.animation = "idle"
	$tooltiptimer.start()
	
func _physics_process(_delta: float) -> void:
	#print(isslowed)
	if dashinv==true:
		$CollisionBox.set_disabled(true)
	if isblinded == true:
		$extradarkness.visible = true	
	if isblinded == false:
		$extradarkness.visible = false
		
	velocity = move_and_slide(physicsType.calculate_move_velocity(velocity, get_direction(), isattacking,isslowed, dash, attacktimer.get_time_left(), dashtimer.get_time_left()))
	
	if velocity.length() > 0:
		
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
func lunge():
	pass
	#velocity = move_and_slide(physicsType.calculate_move_velocity(velocity, get_direction(), isattacking, isslowed))
func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right")-Input.get_action_strength("move_left"), Input.get_action_strength("move_down")-Input.get_action_strength("move_up"))
func _input(event):
	pass
	#if event is InputEventMouseButton:
		#weapon.shoot()
func _unhandled_input(event: InputEvent):
	if event.is_action_released("killswitch"):
		weapon.killswitch()
	if event.is_action_released("shoot"):
		weapon.shoot()
		#isattacking=true
		if weapon.get_type() == Slice:
			isattacking=true
			$attacktimer.start()
			####lunge()
	if event.is_action_released("switch"):
		weapon.switch()
		
	if event.is_action_released("move_right"):
		$dashtimer.start()
		#if dash==1:
			#lunge()
			#dash=0
		rdash=1
		#print(dash)
	if event.is_action_pressed("move_right"):
		if rdash == 1 and candash==true:
			dash = 2
			$dashfl.visible = true
			dashinv = true
			candash=false
			$dashcoold.start()
			#print(dash)
	
	if event.is_action_released("move_left"):
		$dashtimer.start()
		#if dash==1:
			#lunge()
			#dash=0
		ldash=1
	#	print(dash)
	if event.is_action_pressed("move_left"):
		if ldash == 1 and candash==true:
			dash = 2
			$dashfl.visible = true
			dashinv = true
			candash=false
			$dashcoold.start()
		#	print(dash)
	
	if event.is_action_released("move_up"):
		$dashtimer.start()
		#if dash==1:
			#lunge()
			#dash=0
		udash=1
	#	print(dash)
	if event.is_action_pressed("move_up"):
		if udash == 1 and candash==true:
			dash = 2
			$dashfl.visible = true
			dashinv = true
			candash=false
			$dashcoold.start()
			#print(dash)
	
	if event.is_action_released("move_down"):
		$dashtimer.start()
		#if dash==1:
			#lunge()
			#dash=0
		ddash=1
		
		#print(dash)
	if event.is_action_pressed("move_down"):
		if ddash == 1 and candash==true:
			dash = 2
			$dashfl.visible = true
			dashinv = true
			candash=false
			$dashcoold.start()
		#	print(dash)
	
func take_credentials(creds: float):
	var hpup = rng.randf_range(0,10)
	if hpup >= 8:
		if health<=95:
			health+=5
		else:
			if health>95:
				health+= 100-health
		$AnimatedSprite.animation = "hpup"
		$hpparticles.emitting = true
		#$hpparticles.visible = true	
		#$hpparts.start()
		
	clearance += 1	
func take_damage(damage: float):
	if godmode == true:
		return
	if not vulnerable:
		return
	if dashinv==true:
		var dodge = rng.randf_range(0,1)
		if dodge>=.5:
			$dodge.visible=true
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


func _on_attacktimer_timeout():
	isattacking = false # Replace with function body.


func _on_hpparts_timeout():
#	$hpparticles.visible = false	
	pass # Replace with function body.


func _on_tooltiptimer_timeout():
	if $leveltooltip:
		$leveltooltip.visible = false # Replace with function body.


func _on_dashtimer_timeout():
	dash=0 # Replace with function body.
	rdash=0
	ldash=0
	udash=0
	ddash=0
	$dashfl.visible=false
	dashinv = false
	$CollisionBox.set_disabled(false)


func _on_dashcoold_timeout():
	candash=true # Replace with function body.
