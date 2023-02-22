extends RigidBody2D

onready var player = $"../Player"
export var aggro_radius = 500
export var speed = 200
var health = 100


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if not player or position.distance_to(player.position) > aggro_radius:
		set_linear_velocity(Vector2.ZERO)
		return
	set_linear_velocity(speed*position.direction_to(player.position))

# Damage player upon collision
func _on_FlyingEnemy_body_entered(body: Node) -> void:
	pass
func handle_hit():
	health -= 100
	if health <= 0:
		queue_free()
