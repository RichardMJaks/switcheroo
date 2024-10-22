extends InputHandler
class_name PlayerInputHandler

@export var buffer_time = 5
@onready var input_buffer: InputBuffer = $InputBuffer

var wants_to_attack: bool = false: set = _set_attack_intent

var wants_to_dash: bool = false: set = _set_dash_intent

func _ready() -> void:
	input_buffer.buffer_time = buffer_time

func _physics_process(delta: float) -> void:
	movement_direction = Vector2(
		Input.get_axis("m_left", "m_right"),
		Input.get_axis("m_up", "m_down")
	).normalized()

# We handle mouse input here so GUI elements could consume the input beforehand
# Buffering is handled by setters of intents
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("a_attack"):
		wants_to_attack = true
	if event.is_action_pressed("a_dash"):
		wants_to_dash = true

# These setters also buffer the input
#region Setters
func _set_attack_intent(value) -> void:
	# Avoid double-buffering
	if not value:
		wants_to_attack = false
		return
	if wants_to_attack:
		return
	
	wants_to_attack = value
	input_buffer.buffer_input(
		func(): wants_to_attack = false
	)
	wants_to_attack = true
	
func _set_dash_intent(value: bool) -> void:
	# Avoid double-buffering
	if not value:
		wants_to_dash = false
		return
	if wants_to_dash:
		return
	
	wants_to_dash = value
	input_buffer.buffer_input(
		func(): wants_to_dash = false
	)
	wants_to_dash = true

#endregion
