extends Node
class_name State

var input_handler: InputHandler
var anim: AnimationPlayer
@export var animation_name: String
@warning_ignore("unused_signal")
signal change_state(state: State, new_state: State)

func enter() -> void:
	if anim and animation_name:
		anim.play(animation_name)

func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
