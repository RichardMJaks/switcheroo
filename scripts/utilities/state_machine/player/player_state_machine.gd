extends FSM
class_name PlayerFSM

@export var player: Player
@export var body_parts_handler: BodyPartsHandler

func _process(delta: float) -> void:
	super(delta)

# Synchronize any variables for states here.
func sync_state_variables(state: State) -> void:
	super(state)	# Keep this, base FSM class synchronizes certain variables
	if player:
		state.player = player
	if body_parts_handler:
		state.bp = body_parts_handler
