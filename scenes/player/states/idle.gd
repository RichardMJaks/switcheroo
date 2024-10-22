extends PlayerState

@export var moving: PlayerState
@export var attacking: PlayerState
@export var dashing: PlayerState

func enter() -> void:
	super()
	player.velocity = Vector2.ZERO

func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if input_handler.wants_to_attack:
		input_handler.wants_to_attack = false
		change_state.emit(self, attacking)
		return
	if input_handler.wants_to_dash:
		input_handler.wants_to_dash = false
		change_state.emit(self, dashing)

func physics_update(_delta: float) -> void:
	if input_handler.movement_direction:
		change_state.emit(self, moving)
