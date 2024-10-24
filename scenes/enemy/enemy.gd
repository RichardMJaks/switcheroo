extends CharacterBody2D
class_name Enemy

@export var speed: float
@export var health: float

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

func take_damage(amount: int, dir: Vector2) -> void:
	if health <= amount:
		health -= amount
		return
	
	fsm.force_change_state("taking_damage")
	last_knockback_dir = dir
	health -= amount

func _physics_process(_delta: float) -> void:
	move_and_slide()
