extends EnemyState

@export var moving: EnemyState
@export var attack_animations: Array[String]

func enter() -> void:
	super()
	character.velocity = Vector2.ZERO
	attack_handler.look_at(player.position)
	attack_handler.progress_combo()
	if attack_animations.size() > attack_handler._combo_step:
		anim.play(attack_animations[attack_handler._combo_step])

func exit() -> void:
	attack_handler.force_cancel_combo()
	
func update(_delta: float) -> void:
	if not input_handler.wants_to_attack and attack_handler.previous_step_finished:
		change_state.emit(self, moving)
	
	if not attack_handler.previous_step_finished:
		return
	
	attack_handler.look_at(player.position)
	attack_handler.progress_combo()
	if attack_animations.size() > attack_handler._combo_step:
		anim.play(attack_animations[attack_handler._combo_step])
	
	

func physics_update(_delta: float) -> void:
	pass
