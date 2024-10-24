extends Node

enum STAT {FLAT, MULTIPLIER}

var equipped_parts = {
	Util.BODY_TYPE.HEAD: null,
	Util.BODY_TYPE.TORSO: null,
	Util.BODY_TYPE.MAINHAND: null,
	Util.BODY_TYPE.OFFHAND: null,
	Util.BODY_TYPE.RIGHTLEG: null,
	Util.BODY_TYPE.LEFTLEG: null,
}

func _ready() -> void:
	SignalBus.body_part_added.connect(_set_part)

func _set_part(type: Util.BODY_TYPE, part: BodyPart) -> void:
	equipped_parts[type] = part

func get_stat(part_type: Util.BODY_TYPE, stat: STAT) -> float:
	var part = equipped_parts[part_type]
	if not part:
		return 0
	
	match(stat):
		STAT.FLAT:
			return part.flat
		STAT.MULTIPLIER:
			return part.multiplier
	
	return 0
