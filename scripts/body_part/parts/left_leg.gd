extends BodyPart
class_name LeftLeg

@export var flat_movement_speed: float
@export var movement_speed_multiplier: float

func modify_stats(stats: Stats) -> void:
	stats.flat_movement_speed += flat_movement_speed
	stats.movement_speed_multiplier += movement_speed_multiplier
