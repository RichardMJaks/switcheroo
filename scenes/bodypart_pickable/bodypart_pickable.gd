extends Sprite2D
class_name BodyPartPickable

@export var category: Util.BODY_CATEGORY
@export var type: Util.BODY_TYPE
var in_pickup_area: bool = false
	

#TODO: Pickupable shit
func _unhandled_key_input(event: InputEvent) -> void:
	if not in_pickup_area:
		return
	
	if event.is_action_pressed("a_pickup"):
		print("Cat: %s, type: %s" % [category, type])
		var part = BPPreloads.bodyparts_ui[category][type].instantiate()
		SignalBus.body_part_picked_up.emit(part)
		print_debug("Pickup")
		pass
	
	if event.is_action_pressed("a_consume"):
		# destroy this
		# add mana
		print_debug("Consume")
		pass

func _on_arrive_in_pickup_area(area: Area2D) -> void:
	in_pickup_area = true


func _on_leave_pickup_area(area: Area2D) -> void:
	in_pickup_area = false
