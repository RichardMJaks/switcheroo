extends PlayerState

@export var idle: PlayerState
@export var attacking: PlayerState
@export var dashing: PlayerState

func enter() -> void:
	super()

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
	var ms = StatsUtil.stats.movement_speed
	var dir = input_handler.movement_direction
	
	if not dir:
		change_state.emit(self, idle)
		return
	
	if dir.x < 0:
		player.sprite.flip_h = true
	if dir.x > 0:
		player.sprite.flip_h = false
	
	player.velocity = dir * ms
