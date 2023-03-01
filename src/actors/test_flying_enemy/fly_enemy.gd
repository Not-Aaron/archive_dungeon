extends Area2D

onready var player = $"../Player"
export var aggro_radius = 500
export var speed = 200
var health = 20
var damage = 10
var max_health = 20
var velocity = Vector2.ZERO


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if not is_instance_valid(player) or position.distance_to(player.position) > aggro_radius:
		velocity = Vector2.ZERO
		return
	velocity = speed*position.direction_to(player.position)
	position += velocity * delta

# Damage player upon collision
func _on_FlyingEnemy_body_entered(body: Node) -> void:
	if body == player:
		if player.vulnerable:
			player.take_damage(damage)
	
func take_damage(damage: float):
	health -= damage
	if health <= 0:
		die()
		
func die():
	queue_free()
