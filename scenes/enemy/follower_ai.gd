extends Node
class_name AI

@export var character: Enemy
var dir: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if not Global.player:
		dir = Vector2.ZERO
		return
	dir = (Global.player.global_position - character.global_position).normalized()
	
