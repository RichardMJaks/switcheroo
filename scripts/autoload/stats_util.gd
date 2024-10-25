extends Node

#region Movement Speed
var _base_movement_speed: float = 50
var movement_speed: float:
	get():
		var type = Util.BODY_TYPE.LEFTLEG
		var flat = BPUtil.get_stat(type, BPUtil.STAT.FLAT)
		var multiplier = 1 + BPUtil.get_stat(type, BPUtil.STAT.MULTIPLIER)
		return (_base_movement_speed + flat) * multiplier

#endregion

#region Damage
var _base_damage: int = 1
var damage: float:
	get():
		var type = Util.BODY_TYPE.MAINHAND
		var flat = BPUtil.get_stat(type, BPUtil.STAT.FLAT)
		var multiplier = 1 + BPUtil.get_stat(type, BPUtil.STAT.MULTIPLIER)
		return floori((_base_damage + flat) * multiplier)

#endregion

#region Vision Range
var _base_vision_range: float = 10
var vision_range: float:
	get():
		var type = Util.BODY_TYPE.HEAD
		var flat = BPUtil.get_stat(type, BPUtil.STAT.FLAT)
		var multiplier = 1 + BPUtil.get_stat(type, BPUtil.STAT.MULTIPLIER)
		return (_base_vision_range + flat) * multiplier

#endregion

#region Attack Speed
var _base_attack_speed: int = 1
var attack_speed: float:
	get():
		var type = Util.BODY_TYPE.OFFHAND
		var flat = BPUtil.get_stat(type, BPUtil.STAT.FLAT)
		var multiplier = 1 + BPUtil.get_stat(type, BPUtil.STAT.MULTIPLIER)
		return (_base_attack_speed + flat) * multiplier

#endregion

#region Max HP
var _base_max_hp: int = 5
var max_hp: int:
	get():
		var type = Util.BODY_TYPE.TORSO
		var flat = BPUtil.get_stat(type, BPUtil.STAT.FLAT)
		var multiplier = 1 + BPUtil.get_stat(type, BPUtil.STAT.MULTIPLIER)
		return floori((_base_max_hp + flat) * multiplier)
		
#endregion

#region Dash Length
var _base_dash_length: float = 50
var dash_length: float:
	get():
		var flat = 1 + BPUtil.get_stat(Util.BODY_TYPE.RIGHTLEG, BPUtil.STAT.FLAT)
		return (_base_dash_length + flat)
		
#endregion

#region Dash Cooldown
var _base_dash_cd: float = 1
var dash_cd: float:
	get():
		var multiplier = 1 + BPUtil.get_stat(Util.BODY_TYPE.RIGHTLEG, BPUtil.STAT.MULTIPLIER)
		return _base_dash_cd * multiplier

#endregion

var current_health: int = max_hp

var _base_mana: int = 5
var mana: int = _base_mana

func _ready() -> void:
	SignalBus.body_part_consumed.connect(_add_mana)

func _add_mana() -> void:
	if mana < _base_mana:
		mana += 1

func _process(delta: float) -> void:
	if current_health <= 0:
		SignalBus.game_over.emit()
