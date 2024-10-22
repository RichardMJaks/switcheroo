extends FSM
class_name PlayerFSM

@export var player: Player

# Synchronize any variables for states here.
func sync_state_variables(state: State) -> void:
	super(state)	# Keep this, base FSM class synchronizes certain variables
	if player:
		state.player = player
