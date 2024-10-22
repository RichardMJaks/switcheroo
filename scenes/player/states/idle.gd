extends PlayerState

@export var moving: PlayerState
@export var attacking: PlayerState

func enter() -> void:
	super()
	player.velocity = Vector2.ZERO

func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if input_handler.wants_to_attack:
		change_state.emit(self, attacking)

func physics_update(_delta: float) -> void:
	if input_handler.movement_direction:
		change_state.emit(self, moving)
