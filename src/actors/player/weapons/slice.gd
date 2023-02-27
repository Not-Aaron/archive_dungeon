extends Area2D

var damage = 10
onready var kill_timer = $KillTimer

func _ready():
	kill_timer.start()

func set_direction(direction: Vector2):
	set_rotation(direction.angle())

func _on_Slice_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(damage)
		queue_free()


func _on_KillTimer_timeout() -> void:
	queue_free()
