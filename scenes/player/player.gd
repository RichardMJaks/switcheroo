extends CharacterBody2D
class_name Player

@onready var state_machine: FSM = %StateMachine
@onready var sprite: Node2D = %Sprite
@onready var body_parts: BodyPartsHandler = %BodyParts
@onready var stats: Stats = StatsUtil.stats

func _ready() -> void:
	Global.player = self

func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func take_damage(amount: int, dir: Vector2) -> void:
	state_machine.force_change_state("taking_damage")
	StatsUtil.stats.current_health -= amount
	
