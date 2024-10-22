extends PlayerState

@export var idle: PlayerState

func enter() -> void:
	super()

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var ms = player.stats.movement_speed
	var dir = input_handler.movement_direction
	
	if not dir:
		change_state.emit(self, idle)
		return
	
	player.velocity = dir * ms
