extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.game_over.connect(_game_over)

func _game_over() -> void:
	visible = true
	get_tree().paused = true
