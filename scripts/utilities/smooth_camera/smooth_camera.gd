extends Camera2D

@export var follow_speed: float

func _physics_process(delta: float) -> void:
	global_position = global_position.lerp(Global.player.global_position, follow_speed * delta)
