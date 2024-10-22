extends PlayerState

@export var idle: PlayerState
@export var attacking: PlayerState

func enter() -> void:
	super()

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	if input_handler.wants_to_attack:
		change_state.emit(self, attacking)

func physics_update(delta: float) -> void:
	var ms = StatsUtil.stats.movement_speed
	var dir = input_handler.movement_direction
	
	if not dir:
		change_state.emit(self, idle)
		return
	
	player.velocity = dir * ms
