extends Node
class_name BodyPart

@export var type: Util.BODY_TYPE
var state: Util.BODY_STATE = Util.BODY_STATE.DECAYED

func modify_stats(_stats: Stats) -> void:
	pass
