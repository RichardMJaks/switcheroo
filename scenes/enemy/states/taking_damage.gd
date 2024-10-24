extends EnemyState

@export var moving: EnemyState
var passed_time: float = 0
var end_position: Vector2
@export var knockback_amount: float = 17

func enter() -> void:
	super()
	passed_time = 0
	end_position = character.global_position + character.last_knockback_dir * knockback_amount

func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if passed_time > 0.1:
		change_state.emit(self, moving)
	
	passed_time += delta
	character.global_position = character.global_position.lerp(end_position, 1 / 0.1 * delta)
