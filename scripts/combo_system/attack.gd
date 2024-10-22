extends Node2D
class_name Attack

signal finished
@onready var animation_player: AnimationPlayer = get_node_or_null("AnimationPlayer")

func _ready() -> void:
	if animation_player:
		animation_player.animation_finished.connect(finished.emit.unbind(1))

func attack() -> void:
	if not animation_player:
		finished.emit()
		return
	
	animation_player.play("attack")
