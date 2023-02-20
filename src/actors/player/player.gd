extends KinematicBody2D
class_name Player
signal player_fired_bullet(bullet, position, direction)
onready var weapon = $weapon

export (PackedScene) var Bullet
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

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

func _unhandled_input(event: InputEvent):
	if event.is_action_released("shoot"):
		shoot()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
func shoot():
	var bullet_instance = Bullet.instance()
	bullet_instance.global_position = weapon.global_position
	var target = get_global_mouse_position()
	var direction_to_mouse = weapon.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)
	emit_signal("player_fired_bullet",bullet_instance, weapon.position, direction_to_mouse)
