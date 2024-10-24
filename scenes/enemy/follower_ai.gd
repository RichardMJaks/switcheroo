extends Node
class_name AI

@export var character: Enemy
var dir: Vector2 = Vector2.ZERO
var wants_to_attack = false

func _physics_process(_delta: float) -> void:
	if not Global.player:
		dir = Vector2.ZERO
		return
	dir = (Global.player.global_position - character.global_position).normalized()

func _on_player_enters_attack_range(area: Area2D) -> void:
	wants_to_attack = true

func _on_player_leaves_attack_range(area: Area2D) -> void:
	wants_to_attack = false
