extends Panel

@export var slot_type: Util.BODY_TYPE
@onready var holder: Control = $Holder

func _can_drop_data(pos, data) -> bool:
	var held = holder.get_children().size() != 0
	return data.type == slot_type and not held

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.get_parent().remove_child(data)
	holder.add_child(data)
	SignalBus.body_part_added.emit(data.type, data)
