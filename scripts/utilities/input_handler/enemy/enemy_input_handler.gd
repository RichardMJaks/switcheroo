extends InputHandler
class_name EnemyInputHandler

@export var ai: AI

var wants_to_attack: bool = false:
	get():
		return ai.wants_to_attack

func _physics_process(_delta: float) -> void:
	movement_direction = ai.dir
