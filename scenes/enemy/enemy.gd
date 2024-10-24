extends CharacterBody2D
class_name Enemy

@export var speed: float
@export var health: float
@export var type: Util.BODY_CATEGORY

@onready var player: Player = Global.player

@onready var fsm: EnemyFSM = %FSM

var bodypart: BodyPartPickable
var last_knockback_dir: Vector2 = Vector2.ZERO

var dead: bool = false

func _process(_delta: float) -> void:
	if health <= 0 and not dead:
		_die()

#TODO: Implement die
func _die() -> void:
	fsm.force_change_state("dying")
	dead = true
	_drop_part()

func _drop_part() -> BodyPartPickable:
	if not randi_range(1, 10) == 10:
		return null
	
	var part_or_null: PackedScene =\
		BPPreloads.bodyparts_droppable[type][
			Util.BODY_TYPE[
				Util.BODY_TYPE.keys().pick_random()
			]
		]	
	if not part_or_null:
		return null	
	
	var part: BodyPartPickable = BPPreloads.droppable_bodypart.instantiate()
	part.global_position = global_position
	part.category = type
	part.type = Util.BODY_TYPE.keys().pick_random()
	get_tree().current_scene.add_child(part)
	
	return part

func take_damage(amount: int, dir: Vector2) -> void:
	if health <= amount:
		health -= amount
		return
	
	last_knockback_dir = dir
	fsm.force_change_state("taking_damage")
	health -= amount

func _physics_process(_delta: float) -> void:
	move_and_slide()
