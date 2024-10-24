extends BodyPart
class_name OffHand

@export var flat_attack_speed: float = 0
@export var attack_speed_multiplier: float = 0

func modify_stats(stats: Stats) -> void:
	stats.flat_attack_speed += flat_attack_speed
	stats.attack_speed_multiplier += attack_speed_multiplier
