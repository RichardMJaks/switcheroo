extends CharacterBody2D
class_name Player

@onready var stats: Stats = Stats.new()

@onready var state_machine: FSM = %StateMachine
@onready var sprite: Node2D = %Sprite


func _physics_process(delta: float) -> void:
	move_and_slide()
