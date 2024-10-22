extends Node
class_name Stats

var flat_movement_speed: float = StatsUtil.movement_speed
var movement_speed_multiplier: float = 1
var movement_speed: float:
	get():
		return flat_movement_speed * movement_speed_multiplier


var flat_damage: int = StatsUtil.damage
var damage_multiplier: float = 1
var damage: float:
	get():
		return floori(flat_damage * damage_multiplier)


func reset_stats() -> void:
	flat_movement_speed = StatsUtil.movement_speed
	movement_speed_multiplier = 1
	
	flat_damage = StatsUtil.movement_speed
	damage_multiplier = 1
	
func _recalculate_stats() -> void:
	pass
	
