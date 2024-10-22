extends PlayerState

@export var idle: PlayerState
@export var dash_duration: float
var spent_duration: float = 0
var dir: Vector2


func enter() -> void:
	super()
	spent_duration = 0
	dir = input_handler.movement_direction
	if not dir:
		dir = Vector2.RIGHT
		
	player.velocity = dir * (StatsUtil.stats.dash_length / dash_duration)

func exit() -> void:
	spent_duration = 0
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	spent_duration += delta
	if spent_duration > dash_duration:
		change_state.emit(self, idle)
