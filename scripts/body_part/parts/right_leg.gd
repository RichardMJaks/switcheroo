extends BodyPart
class_name RightLeg

@export var flat_dash_length: float = 0
@export var dash_cd_multiplier: float = 0

func modify_stats(stats: Stats) -> void:
	stats.flat_dash_length += flat_dash_length
	stats.dash_cd_multiplier += dash_cd_multiplier
