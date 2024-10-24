extends Node

#region Movement Speed
var _base_movement_speed: float = 100
var flat_movement_speed: float = 0
var movement_speed_multiplier: float = 1
var movement_speed: float:
	get():
		return (_base_movement_speed + flat_movement_speed) * movement_speed_multiplier

#endregion

#region Damage
var _base_damage: int = 1
var flat_damage: int = 0
var damage_multiplier: float = 1
var damage: float:
	get():
		return floori((_base_damage + flat_damage) * damage_multiplier)

#endregion

#region Vision Range
var _base_vision_range: float = 10
var flat_vision_range: float = 0
var vision_range_multiplier: float = 1
var vision_range: float:
	get():
		return (_base_vision_range + flat_vision_range) * vision_range_multiplier

#endregion

#region Attack Speed
var _base_attack_speed: int = 1
var flat_attack_speed: float = 0
var attack_speed_multiplier: float = 1
var attack_speed: float:
	get():
		return (_base_attack_speed + flat_attack_speed) *  attack_speed_multiplier

#endregion

#region Max HP
var _base_max_hp: int = 5
var flat_max_hp: int = 0
var max_hp_multiplier: float = 1
var max_hp: int:
	get():
		return floori((_base_max_hp + flat_max_hp) * max_hp_multiplier)
		
#endregion

#region Dash Length
var _base_dash_length: float = 50
var flat_dash_length: float = 0
var dash_length_multiplier: float = 1
var dash_length: float:
	get():
		return (_base_dash_length + flat_dash_length) * dash_length_multiplier
		
#endregion

#region Dash Cooldown
var _base_dash_cd: float = 1
var flat_dash_cd: float = 0
var dash_cd_multiplier: float = 1
var dash_cd: float:
	get():
		return (_base_dash_cd + flat_dash_cd) * dash_cd_multiplier

#endregion

var current_health: int = max_hp




#TODO: Mana implementation
