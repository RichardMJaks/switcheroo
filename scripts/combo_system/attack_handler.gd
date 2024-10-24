extends Node2D
class_name AttackHandler

@export var character: CharacterBody2D

var _combo_step: int = -1
var _total_combo_steps: int:
	get():
		return _combo_steps.size()
var _combo_steps: Array[Attack] = []

var previous_step_finished: bool = true

signal combo_step_finished(step: int)

func _ready() -> void:
	for child in get_children():
		if child is Attack:
			_combo_steps.append(child)
			child.finished.connect(_finish_step)
			#HACK: I cant be bothered
			if owner is Player:
				child.frame = 4
			child.get_node("Hitbox")\
				.area_entered.connect(
					deal_damage.bind(child.damage_multiplier)
				)

func _finish_step():
	previous_step_finished = true
	combo_step_finished.emit(_combo_step)

func force_cancel_combo() -> void:
	if not previous_step_finished and _combo_step > -1:
		_combo_steps[_combo_step].animation_player.stop()
		
	reset_combo()
	

func progress_combo() -> void:
	if not previous_step_finished:
		return
	
	_combo_step += 1
	if not _combo_step < _total_combo_steps:
		reset_combo()
		_combo_step += 1
	
	previous_step_finished = false
	_combo_steps[_combo_step].animation_player.speed_scale = StatsUtil.stats.attack_speed
	_combo_steps[_combo_step].attack()

func reset_combo() -> void:
	_combo_step = -1
	previous_step_finished = true
	for step in _combo_steps:
		step.frame = 4
		
func deal_damage(area: Area2D, multiplier: float) -> void:
	var damage : int = floori(StatsUtil.stats.damage * multiplier)
	area.owner.take_damage(damage)
