extends Node
class_name BodyPart

@export var flat = 0:
	get():
		match(state):
			Util.BODY_STATE.HEALTHY:
				return flat
			Util.BODY_STATE.DECAYED:
				return 0
			Util.BODY_STATE.STONE_COLD:
				return -(flat / 2)

@export var multiplier = 0:
	get():
		match(state):
			Util.BODY_STATE.HEALTHY:
				return multiplier
			Util.BODY_STATE.DECAYED:
				return 0
			Util.BODY_STATE.STONE_COLD:
				return -(multiplier / 2)

@export var type: Util.BODY_TYPE
var state: Util.BODY_STATE = Util.BODY_STATE.DECAYED
