extends Node
class_name Stats

var flat_movement_speed: float = BaseStats.movement_speed
var movement_speed_multiplier: float = 1
var movement_speed: float:
	get():
		return flat_movement_speed * movement_speed_multiplier


var flat_damage: int = BaseStats.damage
var damage_multiplier: float = 1
var damage: float:
	get():
		return floori(flat_damage * damage_multiplier)

func _ready() -> void:
	SignalBus.body_parts_changed.connect(_recalculate_stats)

#TODO: Implement _recalculate_stats (Probably better to let the body parts handle it themselves)
func _recalculate_stats() -> void:
	pass
	
