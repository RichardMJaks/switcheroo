extends InputHandler
class_name PlayerInputHandler

@export var buffer_time = 5
@onready var input_buffer: InputBuffer = $InputBuffer

var wants_to_attack: bool = false:
	set = _set_attack_intent

var wants_to_dash: bool = false

func _ready() -> void:
	input_buffer.buffer_time = buffer_time

func _physics_process(delta: float) -> void:
	movement_direction = Vector2(
		Input.get_axis("m_left", "m_right"),
		Input.get_axis("m_up", "m_down")
	).normalized()

# We handle mouse input here so GUI elements could consume the input beforehand
func _unhandled_input(event: InputEvent) -> void:
	#TODO: We probably should handle input buffering here also
	if event.is_action_pressed("a_attack"):
		wants_to_attack = true
	if event.is_action_pressed("a_dash"):
		wants_to_dash = true

#region Setters
func _set_attack_intent(value: bool) -> bool:
	# Avoid double-buffering
	if not value:
		return false
	if wants_to_attack:
		return true
	
	wants_to_attack = value
	input_buffer.buffer_input(input_buffer.INPUT.ATTACK, _set_attack_intent.bind(false))
	return value
	
func _set_dash_intent(value: bool) -> bool:
	# Avoid double-buffering
	if not value:
		return false
	if wants_to_dash:
		return true
	
	wants_to_attack = value
	input_buffer.buffer_input(input_buffer.INPUT.DASH, _set_dash_intent.bind(false))
	return value

#endregion
