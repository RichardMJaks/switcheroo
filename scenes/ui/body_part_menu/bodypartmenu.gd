extends Control

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_part_menu"):
		toggle_menu()

func toggle_menu() -> void:
	if visible:
		visible = false
		get_tree().paused = false
		return
	
	visible = true
	get_tree().paused = true
