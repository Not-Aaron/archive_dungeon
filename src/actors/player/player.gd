extends KinematicBody2D
class_name Player
onready var weapon = $weapon
var health = 100
var max_health = 100
var vulnerable = true

export(String, FILE, "*.tscn") var path_to_start
const physics = preload("physics.gd")
var physicsType = physics.Default
var velocity = Vector2.ZERO

func _physics_process(_delta: float) -> void:
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
	return Vector2(Input.get_action_strength("move_right")-Input.get_action_strength("move_left"), Input.get_action_strength("move_down")-Input.get_action_strength("move_up"))

func _unhandled_input(event: InputEvent):
	if event.is_action_released("shoot"):
		weapon.shoot()
	if event.is_action_released("switch"):
		weapon.switch()
	
func take_damage(damage: float):
	if not vulnerable:
		return
	health -= damage
	if health <= 0:
		die()
	else:
		vulnerable = false
		$IFrameTimer.start()
		
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
