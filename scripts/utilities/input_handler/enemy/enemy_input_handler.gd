extends InputHandler
class_name EnemyInputHandler

@export var ai: AI

var wants_to_attack: bool = false

func _physics_process(delta: float) -> void:
	movement_direction = ai.dir
