extends BodyPart
class_name Torso

@export var flat_max_hp: int = 0
@export var max_hp_multiplier: float = 0

func modify_stats(stats: Stats) -> void:
	stats.flat_max_hp += flat_max_hp
	stats.max_hp_multiplier += max_hp_multiplier
