extends PlayerState

@export var idle: PlayerState
@export var dash_duration: float
@export var hurtbox_collider: CollisionShape2D
var spent_duration: float = 0
var dir: Vector2


func enter() -> void:
	super()
	spent_duration = 0
	dir = input_handler.movement_direction
	if not dir:
		dir = Vector2.RIGHT
		
	player.velocity = dir * (StatsUtil.dash_length / dash_duration)
	hurtbox_collider.disabled = true

func exit() -> void:
	hurtbox_collider.disabled = false
	spent_duration = 0
	
func update(_delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	spent_duration += delta
	if spent_duration > dash_duration:
		change_state.emit(self, idle)
