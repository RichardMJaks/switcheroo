extends Node
class_name Stats
## @deprecated not in use anymore

#region Movement Speed
var flat_movement_speed: float = StatsUtil.movement_speed
var movement_speed_multiplier: float = 1
var movement_speed: float:
	get():
		return flat_movement_speed * movement_speed_multiplier

#endregion

#region Damage
@warning_ignore("narrowing_conversion")
var flat_damage: int = StatsUtil.damage
var damage_multiplier: float = 1
var damage: float:
	get():
		return floori(flat_damage * damage_multiplier)

#endregion

#region Vision Range
var flat_vision_range: float = StatsUtil.vision_range
var vision_range_multiplier: float = 1
var vision_range: float:
	get():
		return flat_vision_range * vision_range_multiplier

#endregion

#region Attack Speed
var flat_attack_speed: float = StatsUtil.attack_speed
var attack_speed_multiplier: float = 1
var attack_speed: float:
	get():
		return flat_attack_speed *  attack_speed_multiplier

#endregion

#region Max HP
var flat_max_hp: int = StatsUtil.max_hp
var max_hp_multiplier: float = 1
var max_hp: int:
	get():
		return floori(flat_max_hp * max_hp_multiplier)
		
#endregion

#region Dash Length
var flat_dash_length: float = StatsUtil.dash_length
var dash_length_multiplier: float = 1
var dash_length: float:
	get():
		return flat_dash_length * dash_length_multiplier
		
#endregion

#region Dash Cooldown
var flat_dash_cd: float = StatsUtil.dash_cd
var dash_cd_multiplier: float = 1
var dash_cd: float:
	get():
		return flat_dash_cd * dash_cd_multiplier

#endregion

var current_health: int = max_hp

func reset_stats() -> void:
	flat_movement_speed = StatsUtil.movement_speed
	@warning_ignore("narrowing_conversion")
	movement_speed_multiplier = 1
	
	flat_damage = StatsUtil.damage
	damage_multiplier = 1
	
	flat_vision_range = StatsUtil.vision_range
	vision_range_multiplier = 1
	
	flat_attack_speed = StatsUtil.attack_speed
	attack_speed_multiplier = 1
	
	flat_max_hp = StatsUtil.max_hp
	max_hp_multiplier = 1
	
	flat_dash_length = StatsUtil.dash_length
	dash_length_multiplier = 1
	
	flat_dash_cd = StatsUtil.dash_cd
	dash_cd_multiplier = 1
	
