extends FSM
class_name EnemyFSM

@export var character: Enemy
@export var attack_handler: AttackHandler

# Synchronize any variables for states here.
func sync_state_variables(state: State) -> void:
	super(state)	# Keep this, base FSM class synchronizes certain variables
	if Global.player:
		state.player = Global.player
	if character:
		state.character = character
	if attack_handler:
		state.attack_handler = attack_handler
