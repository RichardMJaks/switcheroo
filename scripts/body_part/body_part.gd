extends Control
class_name BodyPart

@export var flat_min = 0
@export var flat_max = 0

@export var multiplier_min = 0
@export var multiplier_max = 0

@export var flat: float:
	get():
		match(state):
			Util.BODY_STATE.HEALTHY:
				return flat
			Util.BODY_STATE.DECAYED:
				return 0
			Util.BODY_STATE.STONE_COLD:
				return -(flat / 2)
		return 0

@export var multiplier: float:
	get():
		match(state):
			Util.BODY_STATE.HEALTHY:
				return multiplier
			Util.BODY_STATE.DECAYED:
				return 0
			Util.BODY_STATE.STONE_COLD:
				return -(multiplier / 2)
		return 0

@export var type: Util.BODY_TYPE
@export var category: Util.BODY_CATEGORY
var state: Util.BODY_STATE = Util.BODY_STATE.HEALTHY

func _ready() -> void:
	flat += randf_range(flat_min, flat_max)
	multiplier += randf_range(multiplier_min, multiplier_max)
