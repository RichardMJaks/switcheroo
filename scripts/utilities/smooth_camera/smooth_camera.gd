extends Camera2D

@export var follow_speed: float
@export var shake_frames: int = 4
@export var shake_intensity: float = 4
var shaked_frames: int = shake_frames

func _ready() -> void:
	SignalBus.shake_camera.connect(_shake_camera)

func _process(delta: float) -> void:
	if not shaked_frames < shake_frames:
		offset = Vector2.ZERO
		return
	
	offset = Vector2(
		randf_range(-shake_intensity, shake_intensity),
		randf_range(-shake_intensity, shake_intensity)
	)
	shaked_frames += 1

func _physics_process(delta: float) -> void:
	global_position = global_position.lerp(Global.player.global_position, follow_speed * delta)

func _shake_camera() -> void:
	shaked_frames = 0
