extends Panel

@onready var holder: Control = $Holder

func _ready() -> void:
	SignalBus.body_part_picked_up.connect(_add_body_part)

func _get_drag_data(at_position: Vector2) -> Variant:
	var part = holder.get_children()
	if part.size() == 0:
		return null
	if part.size() > 1:
		push_warning("BodyPart holder has multiple children!")
	
	#HACK: Kinda hacky, would preer to create two vars but ehh, it works
	part = part[0]
	
	set_drag_preview(create_preview(part.texture))
	return part

func _add_body_part(part: BodyPart) -> void:
	holder.add_child(part)
	

func create_preview(texture_data: Texture2D) -> TextureRect:
	var rect: TextureRect = TextureRect.new()
	rect.texture = texture_data
	rect.set_anchors_preset(Control.PRESET_CENTER)
	return rect

func _on_stash_consume_button_pressed() -> void:
	var part = holder.get_children()
	if part.size() != 0:
		pass #TODO: Stash Consume
