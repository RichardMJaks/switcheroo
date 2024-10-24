extends BodyPart
class_name Head

@export var flat_vision_range: float = 0
@export var vision_range_multiplier: float = 0

#TODO: Implement head
func modify_stats(stats: Stats) -> void:
	stats.flat_vision_range += flat_vision_range
	stats.vision_range_multiplier += vision_range_multiplier
