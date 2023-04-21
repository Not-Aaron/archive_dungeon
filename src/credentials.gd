extends ProgressBar


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var parent = get_parent()
	if parent is Camera2D or parent is Position2D:
		parent = get_parent().get_parent()
	if parent:
		if parent.clearance_requirement >=1:
			value = parent.clearance*100 / parent.clearance_requirement
		else: 
			value = 100
		
		$TextEdit.text = String(parent.clearance) + "/" + String(parent.clearance_requirement)
		
