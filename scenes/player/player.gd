extends CharacterBody2D
class_name Player

@onready var state_machine: FSM = %StateMachine
@onready var sprite: Node2D = %Sprite

func _ready() -> void:
	Global.player = self

func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func take_damage(amount: int, dir: Vector2) -> void:
	SignalBus.shake_camera.emit()
	StatsUtil.current_health -= amount
	
