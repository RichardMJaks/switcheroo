extends CharacterBody2D
class_name Player

@onready var state_machine: FSM = %StateMachine
@onready var sprite: Node2D = %Sprite
@onready var body_parts: BodyPartsHandler = %BodyParts
@onready var stats: Stats = StatsUtil.stats


func _physics_process(delta: float) -> void:
	move_and_slide()
