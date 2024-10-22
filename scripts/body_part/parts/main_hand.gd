extends BodyPart
class_name MainHand

@export var flat_damage: int = 3
@export var damage_multiplier: float = 1

func modify_stats(stats: Stats) -> void:
	stats.flat_damage += flat_damage
	stats.damage_multiplier += damage_multiplier
