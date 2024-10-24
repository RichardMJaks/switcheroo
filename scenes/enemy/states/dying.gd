extends EnemyState

#HACK: Just have animation deal with the whole dying part

func enter() -> void:
	super()
	character.velocity = Vector2.ZERO
	if character.bodypart:
		var part = character.bodypart
		get_tree().current_scene.add_child(part)
		part.global_position = character.global_position
		

func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
