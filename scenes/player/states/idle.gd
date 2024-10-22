extends PlayerState

@export var moving: PlayerState

func enter() -> void:
	super()
	player.velocity = Vector2.ZERO

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if input_handler.movement_direction:
		change_state.emit(self, moving)
