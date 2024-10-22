extends CharacterBody2D

@export var movement_speed: float

@onready var state_machine: FSM = %StateMachine
@onready var sprite: Sprite2D = %Sprite


func _physics_process(delta: float) -> void:
	
	move_and_slide()
