extends PlayerState

@export var idle: PlayerState
@export var attack_handler: AttackHandler

var combo_buffer_length: int = 3
var current_buffer_length: int = 0

func enter() -> void:
	attack_handler.progress_combo()
	super()

func exit() -> void:
	attack_handler.force_cancel_combo()
	
func update(_delta: float) -> void:
	if not attack_handler.previous_step_finished:
		return
	
	if not current_buffer_length < combo_buffer_length:
		change_state.emit(self, idle)
		current_buffer_length = 0
		return
	
	if not input_handler.wants_to_attack:
		current_buffer_length += 1
		return
	
	print("progressing combos")
	current_buffer_length = 0
	attack_handler.progress_combo()
	

func physics_update(delta: float) -> void:
	pass
