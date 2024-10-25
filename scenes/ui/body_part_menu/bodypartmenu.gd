extends Control

@onready var book: TextureRect = %Book
@onready var part_slot_misc: Panel = %PartSlotMisc

func _ready() -> void:
	SignalBus.body_part_picked_up.connect(toggle_menu.unbind(1))

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_part_menu"):
		book.set_all_unactive()
		toggle_menu()

func toggle_menu() -> void:
	if visible:
		if part_slot_misc.holder.get_children().size() != 0:
			return
		visible = false
		get_tree().paused = false
		return
	
	visible = true
	get_tree().paused = true
