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

func get_stat(part_type: Util.BODY_TYPE, stat: STAT) -> float:
	var part = equipped_parts[part_type]
	if not part:
		if stat == STAT.FLAT:
			return 0
		return 1
	
	match(stat):
		STAT.FLAT:
			return part.flat
		STAT.MULTIPLIER:
			return part.multiplier
	
	return 0
