extends CharacterBody2D
class_name Enemy

@export var speed: float
@export var health: float

@onready var player: Player = Global.player

@onready var fsm: EnemyFSM = %FSM

var bodypart: BodyPartPickable

func _process(_delta: float) -> void:
	if health <= 0:
		_die()

#TODO: Implement die
func _die() -> void:
	fsm.force_change_state("dying")

func take_damage(amount: int) -> void:
	fsm.force_change_state("taking_damage")
	health -= amount

func _physics_process(_delta: float) -> void:
	move_and_slide()
