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
		var part = current_active.holder.get_child(0)
		if part:
			$"../../../Click".play()
			part.queue_free()
			SignalBus.body_part_consumed.emit()


func _on_necromance_button_pressed() -> void:
	if StatsUtil.mana >= 5:
		$"../../../Click".play()
		StatsUtil.mana = 0
		StatsUtil.current_health = StatsUtil.max_hp
