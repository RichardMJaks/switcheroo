extends EnemyState

@export var attacking: EnemyState

func enter() -> void:
	super()

func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if input_handler.wants_to_attack:
		change_state.emit(self, attacking)

func physics_update(_delta: float) -> void:
	var dir = input_handler.movement_direction
	if not dir:
		character.velocity = Vector2.ZERO
	
	character.velocity = dir * character.velocity
