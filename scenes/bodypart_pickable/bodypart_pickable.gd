extends Sprite2D
class_name BodyPartPickable

var category: Util.BODY_CATEGORY
var type: Util.BODY_TYPE
var in_pickup_area: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#TODO: Pickupable shit
func _unhandled_key_input(event: InputEvent) -> void:
	if not in_pickup_area:
		return
	
	if event.is_action_pressed("a_pickup"):
		# Create bodypart object
		# add it to bodypart menu slot
		# open up bodypart menu
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
