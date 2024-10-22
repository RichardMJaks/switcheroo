extends Node
class_name FSM

var states: Dictionary = {}
@export var initial_state: State
var current_state: State

@export var input_handler: InputHandler
@export var animation_player: AnimationPlayer

func _ready() -> void:
	if not input_handler:
		push_warning("Input Handler node is missing! Is this intended?")
	if not animation_player:
		push_warning("Animation Player node is missing! Is this intended?")
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.change_state.connect(_change_state)
			sync_state_variables(child)
		
	if initial_state:
		current_state = initial_state
		current_state.enter()

#region State Runtime
func _process(delta: float) -> void:
	if not current_state:
		return
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	if not current_state:
		return
	current_state.physics_update(delta)

#endregion

#region State Changing Logic
func _change_state(state: State, new_state: State) -> void:
	if not state or not new_state:
		return
	if state != current_state:
		push_error("%s is trying to switch to %s while not current_state!" % [state.name, new_state.name])
	_init_change_state(new_state)

func force_change_state(new_state: String) -> State:
	if not new_state:
		push_warning("Please provide a state name!")
		return null
	
	var state = parse_string(new_state)
	if not state:
		push_error("Failed to force state change to " + new_state)
		return null
	
	return _init_change_state(state)

# This assumes [param new_state] != null
func _init_change_state(new_state: State) -> State:
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()
	
	return current_state
	
#endregion

func sync_state_variables(state: State) -> void:
	if input_handler:
		state.input_handler = input_handler
	if animation_player:
		state.anim = animation_player
		
	

func parse_string(s: String) -> State:
	if not states.has(s):
		push_warning(s + " is not present in states!")
		return null
	
	return states[s]
