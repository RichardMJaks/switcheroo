extends TextureRect

var slots: Array[BPSlot] = []
var current_active: BPSlot = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is BPSlot:
			slots.append(child)
			child.selected.connect(set_new_active)

func set_all_unactive() -> void:
	current_active = null
	for slot in slots:
		slot.set_unactive()

func set_new_active(slot: BPSlot) -> void:
	set_all_unactive()
	current_active = slot
	current_active.set_active()


func _on_consume_button_pressed() -> void:
	if current_active:
		pass #TODO: Consuming


func _on_necromance_button_pressed() -> void:
	if current_active:
		pass #TODO: Necromancing
