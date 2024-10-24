extends Panel
class_name BPSlot

@export var slot_type: Util.BODY_TYPE
@onready var holder: Control = $Holder
@onready var box: TextureRect = $Box
@export var texture: Texture2D
@export var selected_texture: Texture2D

signal selected(slot: BPSlot)

func _can_drop_data(pos, data) -> bool:
	var held = holder.get_children().size() != 0
	return data.type == slot_type and not held

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.get_parent().remove_child(data)
	holder.add_child(data)
	SignalBus.body_part_added.emit(data.type, data)

func set_active():
	box.texture = selected_texture

func set_unactive():
	box.texture = texture

func _gui_input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		selected.emit(self)
