extends PlayerState

@export var idle: PlayerState
@export var attack_handler: AttackHandler

@export var attack_animations: Array[String]
@export var forward_movement_during_attack: float
var end_position: Vector2
var passed_time: float = 0

var combo_buffer_length: int = 3
var current_buffer_length: int = 0

func _calculate_forward_movement_during_attack() -> Vector2:
	return player.global_position\
		+ (Vector2.from_angle(attack_handler.rotation)\
		* forward_movement_during_attack)

func enter() -> void:
	attack_handler.look_at(player.get_global_mouse_position())
	attack_handler.progress_combo()
	if attack_animations.size() > attack_handler._combo_step:
		anim.play(attack_animations[attack_handler._combo_step])
	player.velocity = Vector2.ZERO
	end_position = _calculate_forward_movement_during_attack()
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
	
	current_buffer_length = 0
	
	var mouse_pos = player.get_global_mouse_position()
	attack_handler.look_at(mouse_pos)
	var facing_direction = (mouse_pos - player.global_position).x
	if facing_direction < 0:
		player.sprite.flip_h = true
	if facing_direction > 0:
		player.sprite.flip_h = false
	
	attack_handler.progress_combo()
	if attack_animations.size() > attack_handler._combo_step:
		anim.play(attack_animations[attack_handler._combo_step])
	
	end_position = _calculate_forward_movement_during_attack()
	

func physics_update(delta: float) -> void:
	if attack_handler.previous_step_finished or not end_position:
		passed_time = 0
		return
	
	var anim_time = 0.1 * StatsUtil.stats.attack_speed
	passed_time += delta
	player.global_position = player.global_position.lerp(end_position, 1 / anim_time * delta)
